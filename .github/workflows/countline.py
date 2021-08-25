#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
"""Script to encourage more efficient coding practices.

Methodology:

    Analyses the `lib` and `test` directories to find files that exceed a
    pre-defined number of lines of code.

    This script was created to help improve code quality by encouraging
    contributors to create reusable code.

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
import os
import sys
import argparse


def _excluded_filepaths(excludes):
    """Create a list of full file paths to exclude from the analysis.

    Args:
        excludes: List of files to exclude

    Returns:
        result: A list of full file paths

    """
    # Initialize key variables
    result = []

    if bool(excludes) is True:
        for filename in excludes:
            # Ignore files that appear to be full paths because they start
            # with a '/' or whatever the OS uses to distinguish directories
            if filename.startswith(os.sep):
                result.append(filename)
                continue

            # Create a file path
            filepath = '{}{}{}'.format(os.getcwd(), os.sep, filename)
            if os.path.isfile(filepath) is True:
                result.append(filepath)
    # Return
    return result


def _arg_parser_resolver():
    """Resolve the CLI arguments provided by the user.

    Args:
        None

    Returns:
        result: Parsed argument object

    """
    # Initialize parser and add the CLI options we should expect
    parser = argparse.ArgumentParser()
    parser.add_argument('--lines', type=int, required=False, default=300,
                        help='The maximum number of lines of code to accept.')
    parser.add_argument('--directory', type=str, required=False,
                        default=os.getcwd(),
                        help='The parent directory of files to analyze.')
    parser.add_argument('--exclude', type=str, required=False,
                        nargs='*',
                        default=None,
                        const=None,
                        help='''\
An optional list of files to exclude from the analysis separated by spaces.''')

    # Return parser
    result = parser.parse_args()
    # print(result.exclude)
    # sys.exit(0)
    return result


def main():
    """Analyze dart files.

    This function finds, and prints the files that exceed the CLI
    defined defaults.

    Args:
        None

    Returns:
        None

    """
    # Initialize key variables
    lookup = {}
    errors_found = False
    file_count = 0
    excluded_filepaths = []

    # Get the CLI arguments
    args = _arg_parser_resolver()

    # Define the directories of interest
    directories = [
        os.path.expanduser(os.path.join(args.directory, 'lib')),
        os.path.expanduser(os.path.join(args.directory, 'test'))
    ]

    # Get a corrected list of filenames to exclude
    excluded_filepaths = _excluded_filepaths(args.exclude)

    # Iterate and analyze each directory
    for directory in directories:
        for root, _, files in os.walk(directory, topdown=False):
            for name in files:
                # Read each file and count the lines found
                filepath = os.path.join(root, name)

                # Skip excluded files
                if bool(args.exclude) is True:
                    if filepath in excluded_filepaths:
                        continue

                # Process the rest
                with open(filepath, encoding="latin-1") as code:
                    line_count = sum(
                        1 for line in code
                        if line.strip() and not line.startswith('#')
                    )
                    lookup[filepath] = line_count

    # If the line rule is voilated then the value is changed to 1
    for filepath, line_count in lookup.items():
        if line_count > args.lines:
            errors_found = True
            file_count += 1
            if file_count == 1:
                print('''
LINE COUNT ERROR: Files with excessive lines of code have been found\n''')

            print('  Line count: {:>5} File: {}'.format(line_count, filepath))

    # Evaluate and exit
    if bool(errors_found) is True:
        print('''
The {} files listed above have more than {} lines of code.

Please fix this. It is a pre-requisite for pull request approval.
'''.format(file_count, args.lines))
        sys.exit(1)
    else:
        sys.exit(0)


if __name__ == '__main__':
    main()
