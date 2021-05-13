#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
#This is an pretiffy script.
# It runs on lib and test directory to find files
# which doesn't satisfy trailing comma.

import os
import sys
import argparse

#Function through parse the filesof the directory
def arg_parser_resolver():
    parser = argparse.ArgumentParser(description= 'for parsing across the directory')
    parser.add_argument('--dir', type=str, required=False, default=os.getcwd(),
                        help='directory-location where files are present')
    return parser.parse_args()

#patterm matching and adding trailing commas at the required syntax places
def syntax_matcher(root :str, files: list[str]):
    for name in files:
            file_location = os.path.join(root, name)
            file_count = 0
            data = []
            g = open(file_location, 'r')
            data = g.readlines()
            f = open(file_location, 'w')
            for index in range(0,len(data)):
                if '))' and not ')) {' in data[index]:
                    data[index] = data[index].replace('))', '),)')
                    file_count = file_count + 1

                if ') {' and not ')) {' in data[index] :
                    data[index] = data[index].replace(') {', ',) {') 
                    file_count = file_count + 1

                if ')) {' in data[index] :
                    data[index] = data[index].replace(')) {', ',)) {')
                    file_count = file_count + 1   

                if '),).' in data[index]:
                    data[index] = data[index].replace('),).', ')).')
                    file_count = file_count + 1
                    
                f.write(data[index])
            g.close()
            f.close()
            return file_count
    
# Find, and update, for files having comma in sequence.
def main():
    args = arg_parser_resolver()
    file_count_lib = 0
    file_count_test = 0
    # parses through files and saves to a dict
    file_names_with_size = {}
    # libPath and testPath dir location
    lib_path = os.path.expanduser(os.path.join(args.dir, 'lib'))
    test_path = os.path.expanduser(os.path.join(args.dir, 'test'))
    # counting lines in lib and test
    for root, _, files in os.walk(lib_path, topdown=False): 
       file_count_lib = syntax_matcher(root,files)
    for root, _, files in os.walk(test_path, topdown=False): 
       file_count_test = syntax_matcher(root,files)
    
    print("Number of Files changed in Lib Directory :", file_count_lib)
    print("Number of Files changed in Test Directory :", file_count_test)
    sys.exit(0)


if __name__ == "__main__":
    main()