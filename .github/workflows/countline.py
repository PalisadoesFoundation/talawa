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


def arg_parser_resolver():
    """Resolve the CLI arguments provided by the user.

    Args:
        None

    Returns:
        result: Parsed argument object

    """
    # Initialize parser and add the CLI options we should expect
    parser = argparse.ArgumentParser()
    parser.add_argument('--line', type=int, required=False, default=300,
                        help='an integer for number of lines of code')
    parser.add_argument('--dir', type=str, required=False, default=os.getcwd(),
                        help='directory-location where files are present')

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

    # Get the CLI arguments
    args = arg_parser_resolver()

    # Define the directories of interest
    directories = [
        os.path.expanduser(os.path.join(args.dir, 'lib')),
        os.path.expanduser(os.path.join(args.dir, 'test'))
    ]

    # Iterate and analyze each directory
    for directory in directories:
        for root, _, files in os.walk(directory, topdown=False):
            for name in files:
                # Read each file and count the lines found
                file_path = os.path.join(root, name)
                with open(file_path) as code:
                    line_count = sum(
                        1 for line in code
                        if line.strip() and not line.startswith('#')
                    )
                    lookup[file_path] = line_count

    # if the line rule is voilated then value is changed to 1
    for file_path, line_count in lookup.items():
        if line_count > args.line:
            errors_found = True
            file_count += 1
            if file_count == 1:
                print('''
LINE COUNT ERROR: Files with excessive lines of code have been found\n''')

            print('  Line count: {:>5} File: {}'.format(line_count, file_path))

    # Evaluate and exit
    if bool(errors_found) is True:
        print('''
The {} files listed above have more than {} lines of code.

Please fix this. It is a pre-requisite for pull request approval.
'''.format(file_count, args.line))
        sys.exit(1)
    else:
        sys.exit(0)


if __name__ == '__main__':
    main()
