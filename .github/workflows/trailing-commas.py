"""This is an pretiffy script."""
import os
import sys
import argparse


def arg_parser_resolver():
    """Parse the files of the directory."""
    parser = argparse.ArgumentParser(
        description='for parsing across the directory')
    parser.add_argument('--dir', type=str, required=False, default=os.getcwd(),
                        help='directory-location where files are present')
    return parser.parse_args()


def syntax_matcher(root: str, files: list):
    """Patterm matching and adding trailing commas at the required places."""
    for name in files:

        file_location = os.path.join(root, name)
        data = []
        read_loc = open(file_location, 'r')
        data = read_loc.readlines()
        write_loc = open(file_location, 'w')

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

            # for the unique eception that occured in grops_controller.dart
            if name == 'groups_controller.dart':
                data[index] = data[index].replace('(),)', '())')

            if '),).' in data[index]:
                data[index] = data[index].replace('),).', ')).')
            write_loc.write(data[index])
        read_loc.close()
        write_loc.close()


def main():
    """Find, and update, for files having comma in sequence."""

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
