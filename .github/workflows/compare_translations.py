"""
Script to encourage more efficient coding practices.

Methodology:

    Utility for comparing translations between default and other languages.

    This module defines a function to compare two translations
    and print any missing keys in the other language's translation.
Attributes:

    FileTranslation : Named tuple to represent a combination of file and missing translations.

        Fields:
            - file (str): The file name.
            - missing_translations (list): List of missing translations.

Functions:
    compare_translations(default_translation, other_translation):
        Compare two translations and print missing keys.

     load_translation(filepath):
        Load translation from a file.

    check_translations():
        Load the default translation and compare it with other translations.

     main():
        The main function to run the script.
        Parses command-line arguments, checks for the existence of the specified directory,
        and then calls check_translations with the provided or default directory.


Usage:
    This script can be executed to check and print missing
    translations in other languages based on the default English translation.

Example:
    python compare_translations.py
NOTE:
    This script complies with our python3 coding and documentation standards
    and should be used as a reference guide. It complies with:

        1) Pylint
        2) Pydocstyle
        3) Pycodestyle
        4) Flake8

"""
# standard imports
import argparse
import json
import os
import sys
from collections import namedtuple

# Named tuple for file and missing translations combination
FileTranslation = namedtuple("FileTranslation", ["file", "missing_translations"])


def compare_translations(default_translation, other_translation):
    """Compare two translations and return detailed info about missing/mismatched keys.

    Args:
        default_translation (dict): The default translation.
        other_translation (dict): The other translation.

    Returns:
        list: A list of detailed error messages for each missing/mismatched key.
    """
    errors = []

    for key in default_translation:
        if key not in other_translation:
            error_msg = f"Missing/Mismatched Key: '{key}' - This key is missing in the non-default translation file."
            errors.append(error_msg)

    return errors



def load_translation(filepath):
    """Load translation from a file.

    Args:
        filepath: Path to the translation file

    Returns:
        translation: Loaded translation
    """
    with open(filepath, "r", encoding="utf-8") as file:
        translation = json.load(file)
    return translation



def check_translations(directory):
    """Load default translation and compare with other translations.

    Args:
        directory (str): The directory containing translation files.

    Returns:
        None
    """
    default_translation = load_translation("lang/en.json")
    translations_dir = directory
    translations = os.listdir(translations_dir)
    translations.remove("en.json")  # Exclude default translation

    error_found = False

    for translation_file in translations:
        translation_path = os.path.join(translations_dir, translation_file)
        other_translation = load_translation(translation_path)

        # Compare translations and get detailed error messages
        errors = compare_translations(default_translation, other_translation)
        if errors:
            error_found = True
            print(f"Error in file: {translation_path}")
            for error in errors:
                print(f" - {error}")

    if error_found:
        sys.exit(1)  # Exit with an error status code
    else:
        print("All translations are present")
        sys.exit(0)


def main():
    """
     Parse command-line arguments, check for the existence of the specified directory,
    and call check_translations with the provided or default directory.

    """
    parser = argparse.ArgumentParser(
        description="Check and print missing translations for all non-default languages."
    )
    parser.add_argument(
        "--directory",
        type=str,
        nargs="?",
        default=os.path.join(os.getcwd(), "lang"),
        help="Directory containing translation files(relative to the root directory).",
    )
    args = parser.parse_args()

    if not os.path.exists(args.directory):
        print(f"Error: The specified directory '{args.directory}' does not exist.")
        sys.exit(1)

    check_translations(args.directory)


if __name__ == "__main__":
    main()
