"""Script to encourage more efficient coding practices.

Methodology:

    Utility for comparing translations between default and other languages.

    This module defines a function to compare two translations (default and another language)
    and print any missing keys in the other language's translation.

Functions:
    compare_translations(default_translation, other_translation, language):
        Compare two translations and print missing keys.

    check_translations():
        Load the default translation and compare it with other translations.

Usage:
    This script can be executed to check and print missing translations in other languages
    based on the default English translation.

Example:
    python compare_translations.py

NOTE:

    This script complies with our python3 coding and documentation standards
    and should be used as a reference guide. It complies with:

        1) Pylint
        2) Pydocstyle
        3) Pycodestyle
        4) Flake8

    Run these commands from the CLI to ensure the code is compliant for all
    your pull requests.

"""
import json


def compare_translations(default_translation, other_translation, language):
    """Compare two translations and print missing keys

    Args:
        default_translation: The default translation
        other_translation: The other translation
        language: The language of the other translation


    Returns:
        None

    Prints:
        missing_translations: The missing translations


    """
    missing_translations = []

    for key in default_translation.items():
        if key not in other_translation:
            missing_translations.append(key)

    if missing_translations:
        print(f"Missing translations in {language}:")
        for key in missing_translations:
            print(f"  {key}")
        print("\n")
    else:
        print(f"All translations present in {language}.")


def check_translations():
    """Load default translation"""
    with open("lang/en.json", "r", encoding="utf-8") as default_file:
        default_translation = json.load(default_file)

    # Load all other translations
    languages = ["en", "es", "fr", "de", "hi", "ja", "pt", "zh"]
    for lang in languages:
        if lang == "en":
            continue

        with open(f"lang/{lang}.json", "r", encoding="utf-8") as other_file:
            other_translation = json.load(other_file)

        # Compare translations
        compare_translations(default_translation, other_translation, lang)


if __name__ == "__main__":
    check_translations()
