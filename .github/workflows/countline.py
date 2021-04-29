#!/usr/bin/env python3
# -*- coding: UTF-8 -*-

"""
This is an countline script.

It runs on lib and test directory to find files
which doesn't satisfy a given count limit.
"""

import os
import sys
import argparse


def arg_parser_resolver():
    """Resolve, for arguments provided by user."""
    parser = argparse.ArgumentParser()
    parser.add_argument('--line', type=int, required=False, default=300,
                        help='an integer for number of lines of code')
    parser.add_argument('--dir', type=str, required=False, default=os.getcwd(),
                        help='directory-location where files are present')
    return parser.parse_args()


def main():
    """Find, and print, for files having code lines above a given value."""
    args = arg_parser_resolver()
    # parses through files and saves to a dict
    file_names_with_size = {}

    # libPath and testPath dir location
    lib_path = os.path.expanduser(os.path.join(args.dir, 'lib'))
    test_path = os.path.expanduser(os.path.join(args.dir, 'test'))

    # counting lines in lib dir
    for root, _, files in os.walk(lib_path, topdown=False):
        for name in files:
            file_location = os.path.join(root, name)
            with open(file_location) as code:
                total_lines = sum(
                    1 for line in code
                    if line.strip() and not line.startswith('#')
                )
                file_names_with_size[file_location] = total_lines
    # counting lines in test dir
    for root, _, files in os.walk(test_path, topdown=False):
        for name in files:
            file_location = os.path.join(root, name)
            with open(file_location) as code:
                total_lines = sum(
                    1 for line in code
                    if line.strip() and not line.startswith('#')
                )
                file_names_with_size[file_location] = total_lines
    # if the line rule is voilated then value is changed to 1

    is_line_rule_voilated = 0
    file_count = 0

    for key, value in file_names_with_size.items():
        if value > args.line:
            is_line_rule_voilated = 1
            file_count += 1
            print("{}: {}".format(key, value))
    if is_line_rule_voilated != 0:
        print("Above {} files have more than 300 lines".format(file_count))
        sys.exit(1)
    else:
        sys.exit(0)


if __name__ == "__main__":
    main()
