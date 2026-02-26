#!/usr/bin/env python3
"""Detect sensitive files with configuration file.

Methodology:

    Analyzes files against a list of sensitive file patterns loaded from a
    configuration file.

    This script can detect sensitive files in two modes:

    1. Git diff mode: Compare files changed between two git SHAs
       (use --base_sha and --head_sha)

    2. Direct mode: Check specified files and/or directories
       (use --files and/or --directories)

Other:

    This script complies with our python3 coding and documentation standards
    and should be used as a reference guide. It complies with:

    1) Pylint
    2) Pydocstyle
    3) Pycodestyle
    4) Flake8
    5) Black

    Run these commands from the CLI to ensure the code is compliant for all
    your pull requests.

"""

import argparse
import os
import re
import subprocess
import sys


def _arg_parser_resolver():
    """Resolve the CLI arguments provided by the user.

    Args:
        None

    Returns:
        result: Parsed argument object

    """
    parser = argparse.ArgumentParser(
        description="Check for sensitive file changes in a PR."
    )
    parser.add_argument(
        "--config",
        required=True,
        help="Path to the sensitive file patterns configuration file.",
    )
    parser.add_argument(
        "--base_sha",
        required=False,
        default=None,
        help="The base commit SHA for git diff comparison.",
    )
    parser.add_argument(
        "--head_sha",
        required=False,
        default=None,
        help="The head commit SHA for git diff comparison.",
    )
    parser.add_argument(
        "--files",
        nargs="+",
        required=False,
        default=None,
        help="One or more file paths to check against sensitive patterns.",
    )
    parser.add_argument(
        "--directories",
        nargs="+",
        required=False,
        default=None,
        help="One or more directories to scan for files to check.",
    )
    result = parser.parse_args()
    return result


def _get_changed_files(base_sha, head_sha):
    """Get the list of changed files between base and head commits.

    Args:
        base_sha: The base commit SHA.
        head_sha: The head commit SHA.

    Returns:
        result: List of changed file paths.

    """
    try:
        output = subprocess.check_output(
            [
                "git",
                "diff",
                "--name-only",
                "--diff-filter=ACMRD",
                base_sha,
                head_sha,
            ],
            stderr=subprocess.STDOUT,
        )
        result = output.decode("utf-8").splitlines()
    except subprocess.CalledProcessError as err:
        print(f"Error getting changed files: {err.output.decode('utf-8')}")
        sys.exit(1)
    else:
        return result


def _filepaths_in_directories(directories):
    """Create a list of full file paths based on input directories.

    Args:
        directories: A list of directories to scan.

    Returns:
        result: A list of full file paths.

    """
    result = []
    for directory in directories:
        if not os.path.isdir(directory):
            print(
                f"Error: Directory '{directory}' not found"
                " or is not a valid directory."
            )
            sys.exit(1)
        for root, _, files in os.walk(directory, topdown=False):
            for name in files:
                result.append(os.path.join(root, name))
    return result


def load_sensitive_patterns(config_file):
    """Load and compile sensitive file patterns from the configuration file.

    Args:
        config_file: Path to the configuration file containing regex patterns.

    Returns:
        result: List of compiled regex pattern objects.

    """
    if not os.path.exists(config_file):
        print(f"Error: Configuration file '{config_file}' not found.")
        sys.exit(1)

    result = []
    with open(config_file, encoding="utf-8") as fh_:
        for raw_line in fh_:
            line = raw_line.strip()
            if line and not line.startswith("#"):
                try:
                    pattern = re.compile(line)
                    result.append(pattern)
                except re.error as err:
                    print(f"Error compiling regex '{line}': {err}")
                    sys.exit(1)
    return result


def check_sensitive_files(changed_files, sensitive_patterns):
    """Check if any changed files match sensitive patterns.

    Args:
        changed_files: List of changed file paths to evaluate.
        sensitive_patterns: List of compiled sensitive file regex objects.

    Returns:
        result: List of matched sensitive file paths.

    """
    result = []
    for file_path in changed_files:
        for pattern in sensitive_patterns:
            if pattern.search(file_path):
                result.append(file_path)
                break
    return result


def main():
    """Detect sensitive files in changed files or specified directories.

    Args:
        None

    Returns:
        None

    """
    args = _arg_parser_resolver()

    # Determine which input mode was requested
    has_git_mode = args.base_sha is not None and args.head_sha is not None
    has_direct_mode = args.files is not None or args.directories is not None

    # Reject a single SHA provided without its counterpart
    partial_git_mode = (args.base_sha is not None) != (
        args.head_sha is not None
    )
    if partial_git_mode:
        print(
            "Error: Both --base_sha and --head_sha are required "
            "for git diff mode."
        )
        sys.exit(1)

    # Reject mixing git-diff mode with direct-file mode
    if has_git_mode and has_direct_mode:
        print(
            "Error: Git mode (--base_sha/--head_sha) and direct mode "
            "(--files/--directories) are mutually exclusive."
        )
        sys.exit(1)

    if not has_git_mode and not has_direct_mode:
        print(
            "Error: Provide either (--base_sha and --head_sha) "
            "or (--files and/or --directories)."
        )
        sys.exit(1)

    # Load sensitive patterns from configuration file
    sensitive_patterns = load_sensitive_patterns(args.config)

    # Collect the files to evaluate
    if has_git_mode:
        changed_files = _get_changed_files(args.base_sha, args.head_sha)
    else:
        changed_files = list(args.files or [])
        if args.directories:
            changed_files.extend(_filepaths_in_directories(args.directories))

    # Check the collected files against sensitive patterns
    unauthorized_files = check_sensitive_files(
        changed_files, sensitive_patterns
    )

    if unauthorized_files:
        print("::error::Unauthorized changes detected in sensitive files")
        print("")
        for item in unauthorized_files:
            print(f"- {item}")
        print("")
        print("To override this, apply the 'ignore-sensitive-files-pr' label")
        sys.exit(1)
    else:
        print("No sensitive files changed.")
        sys.exit(0)


if __name__ == "__main__":
    main()
