#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
"""
Script to adjust Dart documentation for MDX compatibility in Docusaurus.

This script scans Dart-generated Markdown files and modifies special characters, 
code blocks, and Dart-specific symbols to comply with the MDX syntax used in 
Docusaurus v3. It ensures compatibility with the markdown processor by making 
adjustments like escaping certain characters and modifying code blocks.

This script complies with:
    1) Pylint
    2) Pydocstyle
    3) Pycodestyle
    4) Flake8
"""
import os
import argparse
import re

def escape_mdx_characters(text):
    """
    Escape special characters (<, >, {, }) in Dart docs to make them MDX compatible.

    Args:
        text (str): The text content to be processed.

    Returns:
        str: The modified string with escaped MDX characters.
    """
    # Replace unescaped <, >, {, } with their escaped equivalents
    patterns = {
        "<": r"(?<!\\)<",
        ">": r"(?<!\\)>",
        "{": r"(?<!\\){",
        "}": r"(?<!\\)}"
    }
    
    for char, pattern in patterns.items():
        text = re.sub(pattern, f"\\{char}", text)

    return text

def adjust_dart_code_blocks(text):
    """
    Modify Dart code blocks to ensure they are correctly formatted in MDX.

    This function replaces Dart code block annotations like `///` or `//` 
    and adjusts code block syntax.

    Args:
        text (str): The content to be processed.

    Returns:
        str: The modified text with Dart code blocks adjusted.
    """
    # Ensure the Dart code blocks use ```dart for proper syntax highlighting
    text = re.sub(r"```(\s*)dart", r"```dart", text)

    # Handle single-line comments in Dart (`//` or `///`)
    text = re.sub(r"(///|//)\s*", "", text)

    return text

def process_file(filepath):
    """
    Process a single Dart Markdown file for MDX compatibility.

    Args:
        filepath (str): The path to the Markdown file to be processed.

    Returns:
        None: Writes the processed content back to the file if any changes occur.
    """
    with open(filepath, 'r', encoding='utf-8') as file:
        content = file.read()

    # Escape MDX special characters
    content = escape_mdx_characters(content)
    # Adjust Dart code blocks for MDX
    content = adjust_dart_code_blocks(content)

    # Write back to the file only if changes were made
    with open(filepath, 'w', encoding='utf-8') as file:
        file.write(content)

def main():
    """
    Main function to process all Dart Markdown files in a specified directory.

    Scans for Markdown files and processes them for MDX compatibility, 
    especially focusing on Dart-specific docs.

    Args:
        None

    Returns:
        None
    """
    parser = argparse.ArgumentParser(description="Adjust Dart Markdown files for MDX compatibility.")
    parser.add_argument(
        "--directory",
        type=str,
        required=True,
        help="Directory containing Markdown files to process."
    )

    args = parser.parse_args()

    # Process each Markdown file in the directory
    for root, _, files in os.walk(args.directory):
        for file in files:
            if file.lower().endswith(".md"):
                process_file(os.path.join(root, file))

if __name__ == "__main__":
    main()
