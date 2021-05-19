#!/usr/bin/env python3
# -*- coding=UTF-8 -*-
"""This is a prettify script so that flutter formatting can work efficiently.

Methodology:
    Analyses the `lib` and `test` directories to go through the code line by
    line and add commas if the syntax matches the conditions.
    This script was created to help improve code quality by making it prettier
    and more readable.

NOTE:
    This script complies with our python3 coding and documentation standards
    and should be used as a reference guide. It complies with:
        1) Pylint
        2) Pydocstyle
        3) Pycodestyle        
    Run these commands from the CLI to ensure the code is compliant for all
    your pull requests if you want to contribute to this file.

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
    parser = argparse.ArgumentParser(
        description='for parsing across the directory')
    parser.add_argument('--dir', type=str, required=False, default=os.getcwd(),
                        help='directory-location where files are present')
    return parser.parse_args()


def syntax_matcher(root: str, files: list):
    """Pattern matching and adding trailing commas at the required places.

    Args: 
        root : Name of the root directory
        files : List of all the files'(including sub-folders) paths

    Returns: 
        None
    """
    for name in files:

        file_location = os.path.join(root, name)
        data = []
        with open(file_location, 'r') as read_loc:
            data = read_loc.readlines()
            with open(file_location, 'w') as write_loc:

                for index in range(0, len(data)):
                    # genral case of addition of commas
                    if '))' and not ')) {' in data[index]:
                        data[index] = data[index].replace('))', '),)')

                    # for cases of function declaration without any parameters
                    if '(,)' in data[index]:
                        data[index] = data[index].replace('(,)', '()')

                    # for commas already exist and formatting is already done
                    if ',));' in data[index]:
                        data[index] = data[index].replace(',));', '));')

                    # for the unique exception occuring in grops_controller.dart
                    # since a conditional operator means it is an IF line
                    # and adding an trailing comma will cause an error
                    if '==' or '!=' in data[index]:
                        data[index] = data[index].replace('(),)', '())')

                    # for removal of comma at the start of function call
                    if '),).' in data[index]:
                        data[index] = data[index].replace('),).', ')).')
                    write_loc.write(data[index])


def main():
    """Find, and update, for files having comma in trailing sequence.

    Args:
        None

    Returns: 
        None

    """
    args = arg_parser_resolver()
    # libPath and testPath dir location
    lib_path = os.path.expanduser(os.path.join(args.dir, 'lib'))
    test_path = os.path.expanduser(os.path.join(args.dir, 'test'))
    # counting lines in lib and test
    for root, _, files in os.walk(lib_path, topdown=False):
        syntax_matcher(root, files)
    for root, _, files in os.walk(test_path, topdown=False):
        syntax_matcher(root, files)
    sys.exit(0)


if __name__ == "__main__":
    main()
