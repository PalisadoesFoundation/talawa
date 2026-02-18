"""Validates i18n translation tags against locale JSON files."""

from __future__ import annotations

# standard imports
import argparse
import ast
import json
import re
import sys
from pathlib import Path

# Add excluding logic for generated files and tests
EXCLUDE_DIRS = {
    "node_modules",
    "dist",
    "build",
    "coverage",
    ".git",
    "public",
}


class ConfigurationError(Exception):
    """Exception raised for configuration errors."""

    pass


def get_keys(data: dict, prefix: str = "") -> set[str]:
    """Flatten nested translation JSON into dot-notation keys.

    Args:
        data: Parsed JSON dictionary containing translation keys.
        prefix: Prefix used for nested key traversal.

    Returns:
        keys: A set of flattened translation keys.
    """
    keys: set[str] = set()
    for key, value in data.items():
        if isinstance(value, dict):
            keys.update(get_keys(value, f"{prefix}{key}."))
        else:
            keys.add(f"{prefix}{key}")
    return keys


def get_translation_keys(data: dict) -> set[str]:
    """Extract translation keys from parsed locale JSON.

    Args:
        data: Parsed JSON dictionary.

    Returns:
        translation_keys: A set of translation keys.
    """
    return get_keys(data)


def load_locale_keys(locales_dir: str | Path) -> set[str]:
    """Load all valid translation keys from locale JSON files.

    Args:
        locales_dir: Path to the locale directory.

    Returns:
        keys: A set of all valid translation keys.

    Raises:
        FileNotFoundError: If the locale directory does not exist.
    """
    base = Path(locales_dir)
    if not base.exists():
        raise FileNotFoundError(locales_dir)

    keys: set[str] = set()

    # Dynamic loading of all JSON files instead of hardcoded list
    for path in base.glob("*.json"):
        try:
            keys.update(get_keys(json.loads(path.read_text(encoding="utf-8"))))
        except (json.JSONDecodeError, OSError) as exc:
            print(
                f"Warning: Failed to parse {path}: {exc}",
                file=sys.stderr,
            )

    if not keys:
        print(
            f"Warning: No translation keys found in {base}",
            file=sys.stderr,
        )

    return keys


def find_translation_tags(source: str | Path) -> set[str]:
    """Find all translation tags used inside a source file or string.

    Handles keyPrefix option in useTranslation calls by prefixing
    the extracted keys with the keyPrefix value.

    For components that receive `t` as a prop (not using useTranslation
    directly), add a comment like:
    // translation-check-keyPrefix: organizationEvents
    to specify the keyPrefix used by the parent component.

    Note:
        This function assumes a single keyPrefix per file. If multiple
        keyPrefixes are found (from useTranslation calls or comment
        directives), only the first one is used for all translation tags.
        A warning is emitted to stderr when this occurs.

    Args:
        source: File path or raw source string.

    Returns:
        found_tags: A set of detected translation keys.
    """
    if isinstance(source, Path):
        try:
            content = source.read_text(encoding="utf-8")
        except (OSError, UnicodeDecodeError):
            return set()
    else:
        content = source

    # Find keyPrefix from useTranslation calls
    # Matches: useTranslation('translation', { keyPrefix: 'namespace' })
    key_prefix_pattern = (
        r"useTranslation\s*\([^)]*keyPrefix\s*:\s*['\"]([^'\"]+)['\"]"
    )
    key_prefixes = re.findall(key_prefix_pattern, content)

    # Also check for explicit keyPrefix comment directive
    # Matches: // translation-check-keyPrefix: namespace
    comment_prefix_pattern = (
        r"(?://|/\*)\s*translation-check-keyPrefix:\s*(\S+)"
    )
    comment_prefixes = re.findall(comment_prefix_pattern, content)

    # Combine prefixes from useTranslation and comments
    all_prefixes = key_prefixes + comment_prefixes

    # Get the primary keyPrefix (if multiple, use the first one found)
    # Note: This assumes single keyPrefix per file. Files with multiple
    # components using different keyPrefixes may have inaccurate results.
    if len(all_prefixes) > 1:
        file_name = str(source) if isinstance(source, Path) else "source"
        print(
            f"Warning: Multiple keyPrefixes found in {file_name}. "
            f"Using first: '{all_prefixes[0]}'. "
            f"Found: {all_prefixes}",
            file=sys.stderr,
        )
    primary_prefix = all_prefixes[0] if all_prefixes else None

    # Find all t('key') calls
    tags = re.findall(
        r"(?:(?:\bi18n)\.)?\bt\(\s*['\"`]([^'\"`\n]+)['\"`]",
        content,
    )

    result = set()
    for tag in tags:
        # Ignore dynamic keys (template interpolations)
        if "${" in tag:
            continue

        # Remove namespace prefix if present (e.g., "translation:key" -> "key")
        clean_tag = tag.split(":")[-1]

        # If the tag already contains a dot (full path), use it as-is
        # Otherwise, prefix it with the keyPrefix if one exists
        if "." in clean_tag or primary_prefix is None:
            result.add(clean_tag)
        else:
            result.add(f"{primary_prefix}.{clean_tag}")

    return result


def get_target_files(
    files: list[str] | None = None,
    directories: list[str] | None = None,
    exclude: list[str] | None = None,
) -> list[Path]:
    """Resolve target source files for translation validation.

    Args:
        files: Explicit list of files to scan.
        directories: Directories to recursively scan.
        exclude: Filename patterns to exclude.

    Returns:
        target_files: A list of source file paths.

    Raises:
        FileNotFoundError: If the default src directory is missing.
    """
    exclude = exclude or []
    targets: list[Path] = []

    if files:
        for file_path in files:
            path = Path(file_path)
            if path.exists() and path.is_file():
                targets.append(path)
            else:
                print(
                    f"Warning: File not found: {file_path}",
                    file=sys.stderr,
                )

    if directories:
        for directory in directories:
            dir_path = Path(directory)
            if dir_path.exists() and dir_path.is_dir():
                targets.extend(dir_path.rglob("*"))
            else:
                print(
                    f"Warning: Directory not found: {directory}",
                    file=sys.stderr,
                )

    if not files and not directories:
        # Scan both src and plugins directories by default
        found_source = False
        for directory in ["src", "plugins"]:
            dir_path = Path(directory)
            if dir_path.exists() and dir_path.is_dir():
                targets.extend(dir_path.rglob("*"))
                found_source = True

        if not found_source:
            raise ConfigurationError(
                "Default 'src' or 'plugins' directory not found"
            )

    return [
        path
        for path in targets
        if path.suffix in {".ts", ".tsx", ".js", ".jsx"}
        and not any(path.name.endswith(x) or x in path.parts for x in exclude)
        and ".spec." not in path.name
        and ".test." not in path.name
    ]


def check_file(path: Path, valid_keys: set[str]) -> list[str]:
    """Check a file for missing translation keys.

    Args:
        path: File path to check.
        valid_keys: Set of valid translation keys.

    Returns:
        missing_keys: A sorted list of missing translation keys.
    """
    return sorted(
        tag for tag in find_translation_tags(path) if tag not in valid_keys
    )


def main() -> None:
    """CLI entry point for translation validation.

    This function parses command-line arguments, loads translation keys,
    validates translation tag usage across source files, and exits with
    appropriate status codes based on the results.

    Args:
        None

    Returns:
        None

    Raises:
        SystemExit: Exits with status code 0 on success, 1 if missing
            translation keys are found, or 2 for configuration errors.
    """
    parser = argparse.ArgumentParser()
    parser.add_argument("--files", nargs="*", default=[])
    parser.add_argument("--directories", nargs="*", default=[])
    parser.add_argument("--locales-dir", default="public/locales/en")
    args = parser.parse_args()

    try:
        valid_keys = load_locale_keys(args.locales_dir)
    except FileNotFoundError as exc:
        print(
            f"Error: Locale directory not found: {exc}",
            file=sys.stderr,
        )
        sys.exit(2)

    try:
        targets = get_target_files(args.files, args.directories)
    except FileNotFoundError as exc:
        print(f"Error: {exc}", file=sys.stderr)
        sys.exit(2)

    errors: dict[str, list[str]] = {}
    for path in targets:
        missing = check_file(path, valid_keys)
        if missing:
            errors[str(path)] = missing

    if errors:
        for file, tags in errors.items():
            print(
                f"File: {file}\n"
                + "\n".join(f"  - Missing: {tag}" for tag in tags)
            )
        sys.exit(1)

    print("All translation tags validated successfully")
    sys.exit(0)


if __name__ == "__main__":
    main()
