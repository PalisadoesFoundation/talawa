#!/usr/bin/env python3
"""Script to check for docstrings."""

import os
import re
import sys
import argparse
from collections import namedtuple
from docstring_parser import parse

Violation = namedtuple("Violation", "line function issue action")


def validate_docstring(file_path):
    """Validate docstrings in a file for compliance with the Google style guide.

    Args:
        file_path (str): Path to the Python file to validate.

    Returns:
        list: List of violations found in the file, with details about
            the issue and corrective action.

    """
    # Initialize key variables
    violations = []

    # Read the file for processing
    try:
        with open(file_path, "r", encoding="utf-8") as fh_:
            lines_with_hard_returns = fh_.readlines()

    except Exception:
        return violations

    # Remove hard returns at the end of each line read
    lines = [_.rstrip() for _ in lines_with_hard_returns]

    # Evaluate each line
    for line_number, line in enumerate(lines):

        # Identify sections of the file that are functions or methods
        if re.match(r"^\s*def ", line):
            # Get the function name and its arguments
            function = extract_function_arguments(line_number, lines)

            # Ignore test functions in test files
            if ignore_function(function, file_path):
                continue

            # Skip if there are python decorator exceptions
            decorator = function_has_decorator(line_number, lines)
            if bool(decorator):
                if decorator_in_docstring_exception_list(decorator):
                    continue

            # Get the docstring
            docstring = extract_docstring(function.name, line_number, lines)
            if bool(docstring.violations):
                # Add the violation to the list
                violations.extend(docstring.violations)

            # Evaluate the relationship between the
            # declared variables and the docstring
            if bool(docstring.fatal) is False:
                bad = match_arguments_to_docstring(
                    function, docstring, line_number
                )
                if bool(bad):
                    violations.extend(bad)

    # Return
    return violations


def ignore_function(function, file_path):
    """Extract the docstring from a list of lines read from a file.

    Args:
        function: Function object
        file_path: Path to file under test

    Returns:
        result: True if function must be ignored

    """
    # Initialize key variables
    result = False
    ignores = ["test_", "tearDownClass", "setUpClass", "setUp", "tearDown"]

    # Ignore test functions in test files
    for ignore in ignores:
        if function.name.startswith(ignore) and ("test_" in file_path):
            result = True

    # Return
    return result


def match_arguments_to_docstring(function, docstring, line_number):
    """Extract the docstring from a list of lines read from a file.

    Args:
        function: Function object
        docstring: Docstring object
        line_number: Number on which the function resides

    Returns:
        result: Violation object list

    """
    # Initialize key variables
    violations = []
    bad_argument_function = False
    bad_argument_docstring = False
    arguments_function = function.arguments
    arguments_docstring = [_.arg_name for _ in docstring.parser.params]

    # Violation if the arguments don't match and return
    if sorted(arguments_function) != sorted(arguments_docstring):
        violations.append(
            Violation(
                line=line_number + 1,
                function=function.name,
                issue="""\
The arguments defined in the docstring don't match those of the function.""",
                action="""\
Adjust your docstring to match the listed function arguments.""",
            )
        )
        return violations

    ######################################################################
    # Logic below only works when both the function and doctring have args
    ######################################################################

    # Check whether docstring arguments match function arguments
    for argument_function in arguments_function:
        # Track whether the argument is defined
        # in the docstring parameters
        for argument_docstring in arguments_docstring:
            if argument_docstring not in arguments_function:
                violations.append(
                    Violation(
                        line=line_number + 1,
                        function=function.name,
                        issue=f"""\
Argument '{argument_docstring}' defined in the docstring is not \
an argument in the function""",
                        action=f"""\
Remove argument '{argument_docstring}' from the docstring""",
                    )
                )
                bad_argument_function = True
                break
        if bad_argument_function:
            break

    # We found an error, no need to continue generating violations
    if not bad_argument_function:
        # Check whether docstring arguments match function arguments
        for argument_docstring in arguments_docstring:
            # Track whether the argument is defined
            # in the function parameters
            for argument_function in arguments_function:
                if argument_function not in arguments_docstring:
                    violations.append(
                        Violation(
                            line=line_number + 1,
                            function=function.name,
                            issue=f"""\
    Argument '{argument_function}' defined in the function is not \
    an argument in the docstring""",
                            action=f"""\
    Add argument '{argument_function}' to the Docstring""",
                        )
                    )
                    bad_argument_docstring = True
                    break
            if bad_argument_docstring:
                break

    # Return
    return violations


def function_has_decorator(start, lines):
    """Extract the arguments of a function read from a file.

    Args:
        start: Starting line to process
        lines: The file as a list of strings split by a new line separator

    Returns:
        result: The decorator line

    """
    # Initialize key variable
    result = None

    # Return
    if start > 0:
        previous_line = lines[start - 1].strip()
        if previous_line.startswith("@"):
            result = previous_line
    return result


def decorator_in_docstring_exception_list(item):
    """Extract the arguments of a function read from a file.

    Args:
        item: Decorator to check

    Returns:
        result: True if an exception

    """
    # Initialize key variable
    result = False
    exceptions = ["@property"]
    property_exceptions = ["setter", "getter"]

    # Return
    for exception in exceptions:
        if exception in item.strip():
            result = True
            break

    for exception in property_exceptions:
        regex = f"^@[a-zA-Z0-9_]*.{exception}$"
        if re.match(regex, item):
            result = True
            break

    # Return
    return result


def extract_function_arguments(start, lines):
    """Extract the arguments of a function read from a file.

    Args:
        start: Starting line to process
        lines: List of lines in the file

    Returns:
        result: Function object

    """
    # Initialize key variables
    func = ""
    possibles = lines[start:]
    arguments = []
    Function = namedtuple("Function", "name arguments")
    method_keywords = ["self", "cls"]

    # Process the function
    for line in possibles:
        if bool(line) is False:
            continue
        elif ("'''" not in line) and ('"""' not in line):
            func = f"{func}{line.strip()}"
        else:
            break

    # Get the arguments
    items = func.split("(")[1].split(",")
    name = func.split()[1].split("(")[0].strip()
    for item in items:
        result = item.split(")")[0].split("=")[0].strip()
        if bool(result):
            # Sometimes arguments have colons. We need everything before.
            arguments.append(result.split(":")[0].strip())

    # Fix arguments for methods
    for keyword in method_keywords:
        if keyword in arguments:
            arguments.remove(keyword)

    # Return
    result = Function(name=name, arguments=arguments)
    return result


def extract_docstring(func_name, line_number, lines):
    """Extract the docstring from a list of lines read from a file.

    Args:
        line_number: Line where the function starts
        lines: The file as a list of strings split by a new line separator
        func_name: Name of the function for the docstring

    Returns:
        result: namedtuple containing the docstring, and status

    """
    # Initialize key variables
    violations = []
    parser = None
    fatal = False
    Docstring = namedtuple(
        "Docstring", "violations docstring parser arguments fatal"
    )
    docstring = ""
    arguments = []
    found_start = False
    found_end = False

    # Process Docstring
    docstring_start = line_number
    while docstring_start < len(lines):
        if bool(is_docstring_delimiter(lines[docstring_start])) is False:
            docstring_start += 1
        else:
            found_start = True
            break

    # Identify the start of the Docstring
    if bool(found_start) is True:
        # Identify the end of the docstring
        docstring_end = docstring_start + 1
        while docstring_end < len(lines):
            if bool(is_docstring_delimiter(lines[docstring_end])) is False:
                docstring_end += 1
            else:
                found_end = True
                break

        # Check to make sure there are defined arguments
        if bool(found_end) is False:
            violations.append(
                Violation(
                    line=line_number + 1,
                    function=func_name,
                    issue="""\
Single line docstring without 'Args:' or 'Results:' sections defined.""",
                    action="""Define the 'Args:' or 'Results:' sections.""",
                )
            )
            fatal = True

        # Extract lines within the docstring area
        if found_start and found_end:

            # Get the lines of the Docstring, strip hard returns
            valid_lines = lines[docstring_start : docstring_end + 1]

            # Convert the docstring lines to a string
            docstring = "\n".join(valid_lines)

            # Parse the docstring
            try:
                parser = parse(docstring)

            except Exception as e:
                violations.append(
                    Violation(
                        line=docstring_start,
                        function=func_name,
                        issue="Docstring parsing error",
                        action=f"""\
Ensure the docstring is properly formatted: {e}""",
                    )
                )

            # Evaluate Docstring description
            docstring_evaluation = evaluate_docstring_description(
                func_name, docstring_start, parser
            )
            if bool(docstring_evaluation):
                violations.extend(docstring_evaluation)

            # Evaluate the Args: section
            argument_evaluation = evaluate_docstring_args(
                func_name, docstring_start, docstring, parser
            )
            if bool(argument_evaluation.violations):
                violations.extend(argument_evaluation.violations)
            else:
                # Update docstring arguments as they are valid
                arguments = argument_evaluation.arguments

                # Evaluate the Returns: section
                bad_returns = evaluate_docstring_returns(
                    func_name, docstring_start, docstring, parser
                )
                if bool(bad_returns):
                    violations.extend(bad_returns)

        else:
            violations.append(
                Violation(
                    line=docstring_start,
                    function=func_name,
                    issue="Unclosed docstring",
                    action="""\
Ensure the docstring is properly closed with triple quotes.""",
                )
            )

    else:
        violations.append(
            Violation(
                line=docstring_start,
                function=func_name,
                issue="Missing docstring",
                action="""\
Add a Google-style docstring to describe this function.""",
            )
        )

    # Return result
    result = Docstring(
        docstring=docstring,
        violations=violations if bool(violations) else None,
        parser=parser,
        arguments=arguments,
        fatal=fatal,
    )
    return result


def evaluate_docstring_description(func_name, docstring_start, parser):
    """Evaluate the Docstring description for validity.

    Args:
        func_name: Function name
        docstring_start: Line in file on which the docstring starts
        parser: Docstring parser

    Returns:
        violations: List of Violations objects

    """
    # Initialize key variables
    violations = []

    # Ensure there is an Docstring description
    short_description = (
        parser.short_description.strip().replace("'''", "").replace('"""', "")
    )
    if bool(short_description) is False:
        violations.append(
            Violation(
                line=docstring_start,
                function=func_name,
                issue="Docstring doesn't have a valid description",
                action="""\
Add a docstring description to the first line.""",
            )
        )

    if bool(parser.blank_after_short_description) is False:
        violations.append(
            Violation(
                line=docstring_start,
                function=func_name,
                issue="\
The Docstring's short description on the first line doesn't \
have a blank line after it.",
                action="""\
Add the trailing blank line.""",
            )
        )

    return violations


def evaluate_docstring_args(func_name, docstring_start, docstring, parser):
    """Evaluate the Docstring arguments for validity.

    Args:
        func_name: Function name
        docstring_start: Line in file on which the docstring starts
        docstring: Docstring
        parser: Docstring parser

    Returns:
        result: DocstringEvaluation object

    """
    # Initialize key variables
    DocstringEvaluation = namedtuple(
        "DocstringEvaluation", "violations arguments"
    )
    violations = []
    arguments = []
    docstring_no_multiple_white_space = " ".join(docstring.split())

    if "Args: None " in docstring_no_multiple_white_space:
        return DocstringEvaluation(violations=violations, arguments=arguments)
    else:
        # Check for Args section
        if "Args:" not in docstring:
            violations.append(
                Violation(
                    line=docstring_start,
                    function=func_name,
                    issue="Missing 'Args' section",
                    action="""\
Add an 'Args:' section listing the arguments this function accepts.""",
                )
            )
        else:
            # Ensure there is an Args section
            if bool(parser.params) is False:
                violations.append(
                    Violation(
                        line=docstring_start,
                        function=func_name,
                        issue="Docstring doesn't have a valid 'Args:' section",
                        action="""\
Add an 'Args:' section with values to the function's docstring""",
                    )
                )
            else:
                # Evaluate each argument
                for argument in parser.params:
                    if bool(argument.arg_name) is False:
                        violations.append(
                            Violation(
                                line=docstring_start,
                                function=func_name,
                                issue="""\
Docstring has no 'Args:' section variable name and description.""",
                                action="""\
Add an 'Args:' section with a variable name and description to \
the function's docstring""",
                            )
                        )
                    if bool(argument.description) is False:
                        violations.append(
                            Violation(
                                line=docstring_start,
                                function=func_name,
                                issue=f"""\
Docstring 'Args:' section variable '{argument.arg_name}' \
needs a description.""",
                                action="Add description to the variable.",
                            )
                        )

    # Get the valid arguments
    if bool(violations) is False:
        arguments = [_.arg_name for _ in parser.params]

    # Return
    result = DocstringEvaluation(violations=violations, arguments=arguments)
    return result


def evaluate_docstring_returns(func_name, docstring_start, docstring, parser):
    """Determine whether string is docstring start or stop.

    Args:
        func_name: Function name
        docstring_start: Line in file on which the docstring starts
        docstring: Docstring
        parser: Docstring parser

    Returns:
        violations: list of violations

    """
    # Initialize key variables
    violations = []
    docstring_no_multiple_white_space = " ".join(docstring.split())

    # Check for Returns section
    if "Returns:" not in docstring:
        violations.append(
            Violation(
                line=docstring_start,
                function=func_name,
                issue="Missing 'Returns:' section",
                action="""\
Add a 'Returns:' section describing the return value.""",
            )
        )
    elif "Returns: None " not in docstring_no_multiple_white_space:

        # The parser fails if the 'Args:' section is set to None AND there
        # is a valid 'Returns:' section
        # This is a workaround where we search for 'Returns: VARIABLE: '
        regex = r"^.*\s+Returns: (\S+): ([a-zA-Z0-9_]*).*$"
        regex_match = re.match(regex, docstring_no_multiple_white_space)
        if bool(parser.params) is False:
            if bool(regex_match) is False:
                violations.append(
                    Violation(
                        line=docstring_start,
                        function=func_name,
                        issue="""\
Docstring has improperly formatted 'Returns:' section""",
                        action="""\
Add a correctly formatted 'Returns:' section to the function's docstring""",
                    )
                )
            else:
                if bool(regex_match.group(2)) is False:
                    violations.append(
                        Violation(
                            line=docstring_start,
                            function=func_name,
                            issue="""\
Docstring 'Returns:' section with no description""",
                            action="""\
Add a description to the 'Returns:' section to the function's docstring""",
                        )
                    )
            return violations

        # Ensure there is an Returns section
        if bool(parser.returns) is False:
            violations.append(
                Violation(
                    line=docstring_start,
                    function=func_name,
                    issue="Docstring has no 'Returns:' section",
                    action="""\
Add a 'Returns:' section to the function's docstring""",
                )
            )
            return violations

        # Ensure there is an Returns section value
        if bool(parser.returns.type_name) is False:
            violations.append(
                Violation(
                    line=docstring_start,
                    function=func_name,
                    issue="""\
Docstring has no 'Returns:' section variable name and description. \
If the return value is 'None', then use 'None'""",
                    action="""\
Add a 'Returns:' section with a variable name and description to \
the function's docstring""",
                )
            )

        elif bool(parser.returns.description) is False:
            violations.append(
                Violation(
                    line=docstring_start,
                    function=func_name,
                    issue=f"""\
Docstring 'Returns:' section variable \
'{parser.returns.type_name}' needs a description.""",
                    action="""Add description to the variable.""",
                )
            )

    # Return
    return violations


def is_docstring_delimiter(line):
    """Determine whether string is docstring start or stop.

    Args:
        line: String of text

    Returns:
        result: True if it's a delimiter

    """
    # Return
    result = bool(
        line.strip().startswith('"""') or line.strip().startswith("'''")
    )
    return result


def check_directory(directory, exclude_dirs=None):
    """Check all Python files in a directory for docstring compliance.

    Specified directories are excluded.

    Args:
        directory (str): Directory to scan.
        exclude_dirs (list): List of directories to exclude.

    Returns:
        dict: Dictionary of file violations.
    """
    # Initialize key variables
    all_violations = {}
    _exclude_dirs = exclude_dirs if bool(exclude_dirs) else []

    # Recursive directory search for files
    for root, dirs, files in os.walk(directory):
        # Skip excluded directories
        dirs[:] = [
            d for d in dirs if os.path.join(root, d) not in _exclude_dirs
        ]

        # Process files in each directory
        for file in files:
            if file.endswith(".py"):
                # Print start of processing
                file_path = os.path.join(root, file)

                # Identify violations in the file
                violations = validate_docstring(file_path)

                # Add any found violations
                if violations:
                    all_violations[file_path] = violations

    # Return
    return all_violations


def main():
    """Start checking the docstrings.

    Args:
        None

    Returns:
        None
    """
    # Header for the help menu of the application
    parser = argparse.ArgumentParser(
        description="""\
This script checks specified directories for compliance with the \
Google Docstring 'Args' and 'Returns' sections.""",
        formatter_class=argparse.RawTextHelpFormatter,
    )

    # CLI argument for starting
    parser.add_argument(
        "--directories",
        required=False,
        default=".",
        nargs="+",
        type=str,
        help="Directories to scan for docsctring compliant python files.",
    )
    args = parser.parse_args()

    # Process the directories
    for directory in args.directories:
        # Identify violations
        violations = check_directory(directory, exclude_dirs=None)

        # Create a message for the violation
        if violations:
            print("")
            for file, issues in sorted(violations.items()):
                for issue in issues:
                    print(
                        f"""\
File Docstring Error: {file}
Line : {issue.line}
Function: {issue.function}
Issue: {issue.issue}
Corrective Action: {issue.action}
"""
                    )
            print(
                f"""\
Follow the online 'Google Python Style Guide' for our docstring expectations.
There are {len(violations)} docstring violations
"""
            )

            sys.exit(1)


if __name__ == "__main__":
    main()
