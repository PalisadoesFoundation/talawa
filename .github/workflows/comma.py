#!/usr/bin/env python3
# -*- coding: UTF-8 -*-

"""
This is an pretiffy script.
It runs on lib and test directory to find files
which doesn't satisfy trailing comma.
"""

import os
import sys
import argparse


def arg_parser_resolver():
    """Resolve, for arguments provided by user."""
    parser = argparse.ArgumentParser()
    parser.add_argument('--dir', type=str, required=False, default=os.getcwd(),
                        help='directory-location where files are present')
    return parser.parse_args()


def main():
    """Find, and print, for files having comma in sequence."""
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
                count = 0
                for line in code:
                    if('))' in line):
                        count += 1
                file_names_with_size[file_location] = count
    # counting lines in test dir
    for root, _, files in os.walk(test_path, topdown=False):
        for name in files:
            file_location = os.path.join(root, name)
            with open(file_location) as code:
                count = 0
                for line in code:
                    if('))' in line):
                        count += 1
                file_names_with_size[file_location] = count
    # if the line rule is voilated then value is changed to 1

    is_line_rule_voilated = 0
    file_count = 0

    for key, value in file_names_with_size.items():
        if value > 0:
            is_line_rule_voilated = 1
            file_count += 1
            print("{}: {}".format(key, value))
    if is_line_rule_voilated != 0:
        print("Above {} files doesn't have trailing comma".format(file_count))
        sys.exit(1)
    else:
        sys.exit(0)


if __name__ == "__main__":
    main()