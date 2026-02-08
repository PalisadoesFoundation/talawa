#!/usr/bin/env python3
"""Detect sensitive files with configuration file."""

import argparse
import os
import re
import subprocess
import sys


def get_changed_files(base_sha, head_sha):
    """Get the list of changed files between base and head commits.

    Args:
        base_sha (str): The base commit SHA.
        head_sha (str): The head commit SHA.

    Returns:
        list: List of changed file paths.
    """
    try:
        # Get the list of changed files using git diff
        result = subprocess.check_output(
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
        changed_files = result.decode("utf-8").splitlines()
        return changed_files
    except subprocess.CalledProcessError as e:
        print(f"Error getting changed files: {e.output.decode('utf-8')}")
        sys.exit(1)


def load_sensitive_patterns(config_file):
    """Load sensitive file patterns from the configuration file.

    Args:
        config_file (str): Path to the configuration file.

    Returns:
        list: List of regex patterns.
    """
    patterns = []
    if not os.path.exists(config_file):
        print(f"Error: Configuration file '{config_file}' not found.")
        sys.exit(1)

    with open(config_file, "r") as f:
        for line in f:
            line = line.strip()
            if line and not line.startswith("#"):
                patterns.append(line)
    return patterns


def check_sensitive_files(changed_files, sensitive_patterns):
    """Check if any changed files match sensitive patterns.

    Args:
        changed_files (list): List of changed file paths.
        sensitive_patterns (list): List of sensitive file regex patterns.

    Returns:
        list: List of unauthorized changed files.
    """
    unauthorized_files = []
    for file_path in changed_files:
        for pattern in sensitive_patterns:
            if re.search(pattern, file_path):
                unauthorized_files.append(file_path)
                break
    return unauthorized_files


def main():
    """Detect sensitive files."""
    parser = argparse.ArgumentParser(
        description="Check for sensitive file changes in a PR."
    )
    parser.add_argument(
        "--config",
        required=True,
        help="Path to the sensitive file patterns config.",
    )
    parser.add_argument(
        "--base_sha",
        required=True,
        help="The base commit SHA for comparison.",
    )
    parser.add_argument(
        "--head_sha",
        required=True,
        help="The head commit SHA for comparison.",
    )

    args = parser.parse_args()

    # Load sensitive patterns
    sensitive_patterns = load_sensitive_patterns(args.config)

    # Get changed files
    changed_files = get_changed_files(args.base_sha, args.head_sha)

    # Check for unauthorized changes
    unauthorized_files = check_sensitive_files(
        changed_files, sensitive_patterns
    )

    if unauthorized_files:
        print("::error::Unauthorized changes detected in sensitive files")
        print("")
        for file in unauthorized_files:
            print(f"- {file}")
        print("")
        print("To override this, apply the 'ignore-sensitive-files-pr' label")
        sys.exit(1)
    else:
        print("No sensitive files changed.")
        sys.exit(0)


if __name__ == "__main__":
    main()
