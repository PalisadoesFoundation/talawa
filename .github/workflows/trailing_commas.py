#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
import os
import sys
import argparse

def arg_parser_resolver():
    parser = argparse.ArgumentParser(description= 'for parsing across the directory')
    parser.add_argument('--dir', type=str, required=False, default=os.getcwd(),
                        help='directory-location where files are present')
    return parser.parse_args()

def syntax_matcher(root :str, files: list[str]):
    for name in files:
            file_location = os.path.join(root, name)
            data = []
            g = open(file_location, 'r')
            data = g.readlines()
            f = open(file_location, 'w')
            for index in range(0,len(data)):
                if '))' and not ')) {' in data[index]:
                    data[index] = data[index].replace('))', '),)')
                if ') {' and not ')) {' in data[index] :
                    data[index] = data[index].replace(') {', ',) {') 
                if ')) {' in data[index] :
                    data[index] = data[index].replace(')) {', ',)) {')      
                if '),).' in data[index]:
                    data[index] = data[index].replace('),).', ')).')
                f.write(data[index])
            g.close()
            f.close()
    

def main():
    args = arg_parser_resolver()
    # parses through files and saves to a dict
    file_names_with_size = {}
    # libPath and testPath dir location
    lib_path = os.path.expanduser(os.path.join(args.dir, 'lib'))
    test_path = os.path.expanduser(os.path.join(args.dir, 'test'))
    # counting lines in lib and test
    for root, _, files in os.walk(lib_path, topdown=False): syntax_matcher(root,files)
    for root, _, files in os.walk(test_path, topdown=False): syntax_matcher(root,files)
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