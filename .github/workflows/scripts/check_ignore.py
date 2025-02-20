#!/usr/bin/env python3
"""Analyze dart files for custom lint rule suppression."""

import argparse
import os
import subprocess
import sys


def _arg_parser_resolver():
    """Resolve the CLI arguments provided by the user.

    Args:
        None

    Returns:
        result: Parsed argument object

    """
    # Initialize parser and add the CLI options we should expect
    parser = argparse.ArgumentParser()

    # Getting merge branch name
    parser.add_argument(
        "--merge_branch_name",
        type=str,
        required=True,
        help="Name of the merging to branch",
    )

    # Github repository
    parser.add_argument(
        "--repository",
        type=str,
        required=True,
        help='''\
Name of the GitHub repository in the format "<USERNAME>/<REPO_NAME>"''',
    )

    # Getting root directory of repository
    parser.add_argument(
        "--directory",
        type=str,
        required=False,
        default=os.getcwd(),
        help="The parent directory of files to analyze.",
    )

    # Return parser
    return parser.parse_args()


def _filepaths_in_directories(directories):
    """Create a list of full file paths based on input directories.

    Args:
        directories: A list of directories

    Returns:
        result: A list of full file paths

    """
    # Initialize key variables
    result = []

    # Iterate and analyze each directory
    for directory in directories:
        for root, _, files in os.walk(directory, topdown=False):
            for name in files:
                # Read each file and count the lines found
                result.append(os.path.join(root, name))
    # Return
    return result


def _check_for_ignore_directive(filePath):
    """Analyze a given file.

    Also check for the presence of ignore directives corresponding
    to any of the custom lint rules.

    A valid ignore directive consists of exactly 3 parts.

    1. `//...`: where `...` represents that `/` can occur any number
       of times > 2.
    2. `ignore:` or `ignore_for_file:`: The part that distinguishes a
        normal comment from a ignore directive.
    3. `name_of_lint_rule`: The rule that it is ignoring.

    These 3 parts may or may not have whitespace between them, but should
    strictly not have any extra character. So

    1. `//ignore:my_lint`, `/////ignore:my_lint`, `//ignore:     my_lint`
       etc are all valid ignore directives.
    2. `// / ignore: my_lint`, `// sdf ignore: my_lint` etc are all
       invalid ones.

    Args:
        filePath: Path of the file to analyze

    Returns:
        boolean: Whether the file contains ignore directive or not.

    """
    # Either it is a non-code file, or the file does not exist.
    # This can happen when `develop-postgres` gets ahead of your branch and
    # has some files which you don't have

    if (
        not filePath.startswith("lib")
        or not filePath.endswith(".dart")
        or not os.path.exists(filePath)
    ):
        return False

    # Exclude generated files
    if (
        "generated" in filePath
        or filePath == "lib/generated_plugin_registrant.dart"
    ):
        return False

    with open(filePath, "r") as file:
        lines = file.readlines()

        for index, line in enumerate(lines):
            # Remove any leading or trailing whitespace
            content = line.strip()

            # If the line is empty or is a documentation (`///`)
            if content.endswith("/") or content == "":
                continue

            # Points to the character just after '/' ends.
            # This is required because '/' can occur many times.
            non_comment_pos = 0

            while content[non_comment_pos] == "/":
                non_comment_pos += 1

            # Remove whitespace from non '/' part and split to whitespace
            content = (content[non_comment_pos:].strip()).split(" ")

            # Filter out empty strings, which happen because of
            # 'sdf <a lot of spaces> sdf'
            # .split(' ') adds these whitespaces to the token list too.
            content = [token for token in content if token != ""]

            # if somehow we still ended up with whitespaces.
            if len(content) == 0:
                break

            # After removing the '/'s, only two possibilities remain
            # 1. The `ignore...:` and `lint_rule_name` have no whitespace
            #    between them
            # 2. They have some whitespace(s) between them

            if (
                len(content) == 1
                and (
                    content[0] == "ignore_for_file:talawa_api_doc"
                    or content[0] == "ignore:talawa_api_doc"
                    or content[0] == "ignore_for_file:talawa_good_doc_comments"
                    or content[0] == "ignore:talawa_good_doc_comments"
                )
            ) or (
                len(content) == 2
                and (
                    (
                        content[0] == "ignore_for_file:"
                        and content[1] == "talawa_api_doc"
                    )
                    or (
                        content[0] == "ignore:"
                        and content[1] == "talawa_api_doc"
                    )
                    or (
                        content[0] == "ignore_for_file:"
                        and content[1] == "talawa_good_doc_comments"
                    )
                    or (
                        content[0] == "ignore:"
                        and content[1] == "talawa_good_doc_comments"
                    )
                )
            ):

                print(
                    f"""\
Ignore directive found at line {index}, which suppresses a custom lint rule.
Please remove this suppression and add valid documentation for \
the respective field(s)."""
                )

                return True

    return False


def main():
    """Analyze dart files for custom lint rule suppression.

    Analyzes and prints the files that contain suppression for any custom
    lint rule

    Args:
        None

    Returns:
        None

    """
    print(
        subprocess.check_output(["git", "branch"]).decode("utf-8").strip("\n")
    )

    current_branch = (
        subprocess.check_output(["git", "branch", "--show-current"])
        .decode("utf-8")
        .strip("\n")
    )
    print(current_branch)
    changed_files = (
        subprocess.check_output(
            ["git", "diff", "--name-only", "develop-postgres", current_branch]
        )
        .decode("utf-8")
        .splitlines()
    )
    print(changed_files)

    # List of files where ignore directive is found
    err = []

    # Iterate and analyze each directory
    for filepath in changed_files:
        if _check_for_ignore_directive(filepath):
            err.append(filepath)

    # If no changed/modified contains ignore directive for any custom lint rule
    if len(err) == 0:
        print(
            """\
Hurrah! No ignore directive found in any modified/added file(s)"""
        )
        sys.exit(0)
    else:
        print(
            """\
Ignore directive for custom lint rule found. \
Please remove them and add valid documentation."""
        )
        for failing_file in err:
            print(f""">>> File name: {failing_file}\n""")
        sys.exit(1)


if __name__ == "__main__":
    main()
