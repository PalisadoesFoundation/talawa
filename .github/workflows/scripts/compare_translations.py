"""Compare implementation of translation keys across different locales.

This script compares the default English translation file (en.json) with
other locale translation files to identify missing keys or keys that
do not exist in the source.

Usage:
    python compare_translations.py --directory <path_to_locales>

Example:
    python compare_translations.py --directory public/locales
"""

# standard imports
import argparse
import json
import os
import sys


def compare_translations(
    default_translation, other_translation, default_file, other_file
):
    """Compare two translations for missing and/or mismatched keys.

    Args:
        default_translation (dict): The default translation (en.json).
        other_translation (dict): The other language translation.
        default_file (str): The name of the default translation file.
        other_file (str): The name of the other
                            translation file.

    Returns:
        list: A list of detailed error messages for each missing/mismatched key.
    """
    errors = []

    # Check for missing keys in other_translation
    for key in default_translation:
        if key not in other_translation:
            error_msg = f"""\
Missing Key: '{key}' - This key from '{default_file}' \
is missing in '{other_file}'."""
            errors.append(error_msg)
    # Check for keys in other_translation that don't
    # match any in default_translation
    for key in other_translation:
        if key not in default_translation:
            error_msg = f"""\
Error Key: '{key}' - This key in '{other_file}' \
does not match any key in '{default_file}'."""
            errors.append(error_msg)
    return errors


def flatten_json(nested_json, parent_key=""):
    """Flattens a nested JSON, concatenating keys to represent the hierarchy.

    Args:
        nested_json (dict): The JSON object to flatten.
        parent_key (str): The base key for recursion to track key hierarchy.

    Returns:
        dict: A flattened dictionary with concatenated keys.
    """
    flat_dict = {}

    for key, value in nested_json.items():
        # Create the new key by concatenating parent and current key
        new_key = f"{parent_key}.{key}" if parent_key else key

        if isinstance(value, dict):
            # Recursively flatten the nested dictionary
            flat_dict.update(flatten_json(value, new_key))
        else:
            # Assign the value to the flattened key
            flat_dict[new_key] = value

    return flat_dict


def load_translation(filepath):
    """Load translation from a file.

    Args:
        filepath: Path to the translation file

    Returns:
        translation: Loaded translation
    """
    try:
        with open(filepath, encoding="utf-8") as file:
            content = file.read()
            if not content.strip():
                print(
                    f"Warning: File {filepath} is empty",
                    file=sys.stderr,
                )
                return {}
            translation = json.loads(content)
            flattened_translation = flatten_json(translation)
    except json.JSONDecodeError as e:
        print(
            f"Warning: Error decoding JSON from file {filepath}: {e}",
            file=sys.stderr,
        )
        return {}
    except FileNotFoundError:
        print(
            f"Warning: File {filepath} not found.",
            file=sys.stderr,
        )
        return {}
    else:
        return flattened_translation


def check_translations(directory):
    """Load default translation and compare with other translations.

    Args:
        directory (str): The directory containing translation files.

    Returns:
        None
    """
    default_language_dir = os.path.join(directory, "en")

    if not os.path.exists(default_language_dir):
        print(
            f"Error: Default language directory '{default_language_dir}' "
            "does not exist.",
            file=sys.stderr,
        )
        sys.exit(1)

    # Dynamic file detection instead of hardcoded list
    default_files = [
        f for f in os.listdir(default_language_dir) if f.endswith(".json")
    ]

    default_translations = {}
    for file in default_files:
        file_path = os.path.join(default_language_dir, file)
        default_translations[file] = load_translation(file_path)

    languages = [
        d
        for d in os.listdir(directory)
        if os.path.isdir(os.path.join(directory, d))
    ]

    if "en" in languages:
        languages.remove("en")  # Exclude default language directory

    error_found = False

    for language in languages:
        language_dir = os.path.join(directory, language)
        for file in default_files:
            default_translation = default_translations[file]
            other_file_path = os.path.join(language_dir, file)

            if not os.path.exists(other_file_path):
                print(f"File {language}/{file} is missing.", file=sys.stderr)
                error_found = True
                continue

            other_translation = load_translation(other_file_path)

            # Compare translations and get detailed error messages
            errors = compare_translations(
                default_translation,
                other_translation,
                f"en/{file}",
                f"{language}/{file}",
            )
            if errors:
                error_found = True
                print(f"File {language}/{file} has missing translations for:")
                for error in errors:
                    print(f"  - {error}")

    if error_found:
        sys.exit(1)  # Exit with an error status code
    else:
        print("All translations are present")
        sys.exit(0)


def main():
    """Compare translations.

    Parse command-line arguments, check for the existence of the specified
    directory and call check_translations with the provided or default
    directory.

    Args:
        None

    Returns:
        None

    """
    # Initialize key variables
    parser = argparse.ArgumentParser(
        description="""\
Check and print missing translations for all non-default languages."""
    )
    parser.add_argument(
        "--directory",
        type=str,
        nargs="?",
        default=os.path.join(os.getcwd(), "public/locales"),
        help="""\
Directory containing translation files(relative to the root directory).""",
    )
    args = parser.parse_args()

    if not os.path.exists(args.directory):
        print(
            f"Error: The specified directory '{args.directory}' "
            "does not exist.",
            file=sys.stderr,
        )
        sys.exit(1)

    check_translations(args.directory)


if __name__ == "__main__":
    main()
