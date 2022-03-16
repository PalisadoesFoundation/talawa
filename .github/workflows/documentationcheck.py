"""Script to encourage documentation addition of changes incurred

Methodology:

    Getting latest commit from merging branch and feature branch
    Getting all differences in files under lib directory
    Checking if documentation status is missing, not_updated or updated

    This script is to help better document the functionality

NOTE:

    This script complies with our python3 coding and documentation standards
    and should be used as a reference guide. It complies with:

        1) Pylint
        2) Pydocstyle
        3) Pycodestyle
        4) Flake8

    Run these commands from the CLI to ensure the code is compliant for all
    your pull requests.
"""

# Standard imports
import argparse
import os
import sys

import git
import enum


class DocumentationStatus(enum.Enum):
    unknown = 0
    updated = 1
    not_updated = 2
    missing = 3


def _arg_parser_resolver():
    """Resolve the CLI arguments provided by the user.

    Args:
        None

    Returns:
        result: Parsed argument object

    """
    # Initialize parser and add the CLI options we should expect
    parser = argparse.ArgumentParser()
    # getting merge branch name
    parser.add_argument(
        '--merge_branch_name', type=str, required=False, default='develop',
        help='Name of the merging to branch')
    # Github actor name
    parser.add_argument(
        '--actor', type=str, required=False, default='palisadoes',
        help='Name of the github actor running script')
    # getting root directory of repository
    parser.add_argument(
        '--directory', type=str, required=False,
        default=os.getcwd(),
        help='The parent directory of files to analyze.')
    # Return parser
    result = parser.parse_args()
    return result


def check_for_documentation(diff_item):
    """Determine the documentation status

        Args:
            diff_item: Diff to check

        Returns:
            doc_status: DocumentationStatus

    """
    # Extracting the changes made
    file_diffs = diff_item.diff.decode("utf-8")
    # Setting documentation status flag to unknown
    doc_status = DocumentationStatus.unknown
    # Splitting the changes for line by line iteration
    lines = file_diffs.split('\n')
    # Setting updated doc line count
    edited_doc_line_count = 0
    # Looping over differences
    for line in lines:
        # checking if the line was updated and contains documentation
        if line.strip() and line.startswith('+') and line.__contains__('///'):
            # updating the flag by one
            edited_doc_line_count += 1
    # Checking if no doc was changed
    if edited_doc_line_count == 0:
        # Setting the flag to not_updated
        doc_status = DocumentationStatus.not_updated

        # Reading complete file to check if not documentation exist
        # Reading the complete file
        file = diff_item.b_blob.data_stream.read().decode('utf-8')
        # Splitting the line to check if documentation is present or not
        lines = file.split('\n')
        # Setting the documentation line count flag
        doc_lines = 0
        # Looping over the file lines
        for line in lines:
            # Checking if the line contains any documentation or not
            if line.strip() and line.__contains__('///'):
                # updating the flag by 1
                doc_lines += 1
        # Checking if the documentation lines were present or not
        if doc_lines == 0:
            # Updating the flag to missing
            doc_status = DocumentationStatus.missing
    # Checking if the doc was updated
    elif edited_doc_line_count > 0:
        # Setting the flag to documentation updated
        doc_status = DocumentationStatus.updated
    # return the file documentation status
    return doc_status


def main():
    """Analyze dart files.

    This function finds, and prints the files that exceed the CLI
    defined defaults.

    Returns:
        None

    """
    # Parsing the command line arguments
    args = _arg_parser_resolver()
    # Getting the git repo
    repo_feature = git.Repo(args.directory)
    repo_merge = git.Repo.clone_from("https://github.com/"+args.actor+"/talawa.git", args.directory+"/talawa")
    # Getting latest commit on latest branch
    commit_dev = repo_merge.commit(args.merge_branch_name)
    # Getting latest commit on feature branch
    feature_commit = repo_feature.commit()
    # Loading differences between the two commits
    diff_index = commit_dev.diff(feature_commit, create_patch=True)
    # Setting a flag to keep record of files and their documentation
    lookup = {}
    # Lopping over differences in modified files
    for diff_item in diff_index.iter_change_type('M'):
        # Getting file path of difference
        file_path = diff_item.b_path
        # Checking if a file under codebase(lib) directory was modified
        if file_path.startswith('lib'):
            # Getting file documentation status
            lookup[file_path] = check_for_documentation(diff_item)
    # Lopping over differences in added files
    for diff_item in diff_index.iter_change_type('A'):
        # Getting file path of difference
        file_path = diff_item.b_path
        # Checking if a file under codebase(lib) directory was added
        if file_path.startswith('lib'):
            # Getting file documentation status
            lookup[file_path] = check_for_documentation(diff_item)
    # Filtering files whose documentation status != updated
    filtered_lookup = {k: v for (k, v) in lookup.items() if DocumentationStatus.updated != v}
    # Checking if documentation was updated for all changed files
    if len(filtered_lookup) == 0:
        print('''🚀 {} Hurrah! documentation was updated in all modified/added files'''.format('\033[92m'))
        sys.exit(0)
    else:
        print(
            '''🔍 {}DOCUMENTATION NOT UPDATED: Files with missing or not updated documentation found'''.format(
                '\033[91m'))
        for failing_file in filtered_lookup:
            print('''>>> File name: {}\n\t{}\n'''.format(failing_file, filtered_lookup[failing_file]))
        sys.exit(1)


if __name__ == '__main__':
    main()
