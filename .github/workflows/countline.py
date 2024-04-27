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
from collections import namedtuple


def _valid_filename(filepath):
    """Determine whether filepath has the correct filename.

    Args:
        filepath: Filepath to check

    Returns:
        result: True if valid

    """
    # Initialize key variables
    invalid_filenames = [".test.", ".spec."]
    result = True

    # Test
    for invalid_filename in invalid_filenames:
        if invalid_filename.lower() not in filepath.lower():
            continue
        result = False

    return result


def _valid_extension(filepath):
    """Determine whether filepath has the correct extension.

    Args:
        filepath: Filepath to check

    Returns:
        result: True if valid

    """
    # Initialize key variables
    invalid_extensions = [".css", ".jpg", ".png", ".jpeg"]
    result = True

    # Test
    for invalid_extension in invalid_extensions:
        if filepath.lower().endswith(invalid_extension.lower()) is False:
            continue
        result = False

    return result


def _valid_exclusions(excludes):
    """Create a list of full file paths to exclude from the analysis.

    Args:
        excludes: Excludes object

    Returns:
        result: A list of full file paths

    """
    # Initialize key variables
    result = []
    filenames = []
    more_filenames = []

    # Create a list of files to ignore
    if bool(excludes.files):
        filenames = excludes.files
    if bool(excludes.directories):
        more_filenames = _filepaths_in_directories(excludes.directories)
    filenames.extend(more_filenames)

    # Remove duplicates
    filenames = list(set(filenames))

    # Process files
    for filename in filenames:
        # Ignore files that appear to be full paths because they start
        # with a '/' or whatever the OS uses to distinguish directories
        if filename.startswith(os.sep):
            continue

        # Create a file path
        filepath = "{}{}{}".format(os.getcwd(), os.sep, filename)
        if os.path.isfile(filepath) is True:
            result.append(filepath)

    # Return
    return result


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


def _arg_parser_resolver():
    """Resolve the CLI arguments provided by the user.

    Args:
        None

    Returns:
        result: Parsed argument object

    """
    # Initialize parser and add the CLI options we should expect
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--lines",
        type=int,
        required=False,
        default=300,
        help="The maximum number of lines of code to accept.",
    )
    parser.add_argument(
        "--directory",
        type=str,
        required=False,
        default=os.getcwd(),
        help="The parent directory of files to analyze.",
    )
    parser.add_argument(
        "--exclude_files",
        type=str,
        required=False,
        nargs="*",
        default=None,
        const=None,
        help="""An optional space separated list of \
files to exclude from the analysis.""",
    )
    parser.add_argument(
        "--exclude_directories",
        type=str,
        required=False,
        nargs="*",
        default=None,
        const=None,
        help="""An optional space separated list of \
directories to exclude from the analysis.""",
    )

    # Return parser
    result = parser.parse_args()
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
    Excludes = namedtuple("Excludes", "files directories")

    # Get the CLI arguments
    args = _arg_parser_resolver()

    # Define the directories of interest
    directories = [
        os.path.expanduser(os.path.join(args.directory, "lib")),
        os.path.expanduser(os.path.join(args.directory, "src")),
        os.path.expanduser(os.path.join(args.directory, "test")),
    ]

    # Get a corrected list of filenames to exclude
    exclude_list = _valid_exclusions(
        Excludes(
            files=args.exclude_files, directories=args.exclude_directories
        )
    )

    # Get interesting filepaths
    repo_filepath_list = _filepaths_in_directories(directories)

    # Iterate and analyze each directory
    for filepath in repo_filepath_list:
        # Skip excluded files
        if filepath in exclude_list:
            continue

        # Skip /node_modules/ sub directories
        if "{0}node_modules{0}".format(os.sep) in filepath:
            continue

        # Ignore invalid file extensions
        if _valid_extension(filepath) is False:
            continue

        # Ignore invalid file filenames
        if _valid_filename(filepath) is False:
            continue

        # Process the rest
        with open(filepath, encoding="latin-1") as code:
            line_count = sum(
                1
                for line in code
                if line.strip()
                and not (
                    line.strip().startswith("#")
                    or line.strip().startswith("/")
                )
            )
            lookup[filepath] = line_count

    # If the line rule is voilated then the value is changed to 1
    for filepath, line_count in lookup.items():
        if line_count > args.lines:
            errors_found = True
            file_count += 1
            if file_count == 1:
                print(
                    """
LINE COUNT ERROR: Files with excessive lines of code have been found\n"""
                )

            print("  Line count: {:>5} File: {}".format(line_count, filepath))

    # Evaluate and exit
    if bool(errors_found) is True:
        print(
            """
The {} files listed above have more than {} lines of code.

Please fix this. It is a pre-requisite for pull request approval.
""".format(
                file_count, args.lines
            )
        )
        sys.exit(1)
    else:
        sys.exit(0)


if __name__ == "__main__":
    main()
