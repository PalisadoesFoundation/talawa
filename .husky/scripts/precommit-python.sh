#!/usr/bin/env bash
#
# =============================================================================
# Pre-Commit Python Checks
# =============================================================================
#
# Initializes a Python virtual environment and runs all Python-based
# validation and policy checks used by CI.
#
# Checks include:
# - Formatting and linting (black, flake8, pydocstyle)
# - Documentation and translation validation
# - File complexity limits
# - Security checks via external, checksum-verified scripts
# - CSS policy checks on staged files
#
# External Script Caching:
# - Centralized scripts are downloaded from PalisadoesFoundation/.github
# - Cached locally to reduce network dependency
# - SHA256 verification ensures script integrity
#
# Design Notes:
# - Supports Windows via cmd.exe execution
# - Uses null-delimited file lists for safety
# - Falls back gracefully when no staged files are present
#
# =============================================================================
set -euo pipefail

. "$(git rev-parse --show-toplevel)/.husky/scripts/fetch-verified.sh"
. "$(git rev-parse --show-toplevel)/.husky/scripts/staged-files.sh"

STAGED_SRC_DIRS="$(mktemp)"
trap 'rm -f "$STAGED_SRC_DIRS"' EXIT

# =============================================================================
# Configuration constants
# =============================================================================

# Maximum allowed lines per file before triggering complexity warnings.
# This helps prevent large, hard-to-maintain files from being committed.
MAX_FILE_LINES=600

# Cache duration (in hours) for externally downloaded scripts.
# Reduces network dependency while ensuring periodic updates.
SCRIPT_CACHE_HOURS=24

STAGED_SRC_FILE="${1:-}"
if [ -z "$STAGED_SRC_FILE" ]; then
  echo "Error: staged file list path is required." >&2
  exit 1
fi

echo "Initializing Python virtual environment..."
VENV_BIN=$(./.husky/scripts/venv.sh) || exit 1

if command -v cmd.exe >/dev/null 2>&1; then
  set -- cmd.exe //c "$VENV_BIN"
else
  set -- "$VENV_BIN"
fi

echo "Running Python formatting and lint checks..."

"$@" -m black --check .github plugins scripts
"$@" -m pydocstyle --convention=google --add-ignore=D415,D205 .github plugins scripts
"$@" -m flake8 --docstring-convention google --ignore E402,E722,E203,F401,W503 .github plugins scripts

echo "Running Python CI parity checks..."

"$@" .github/workflows/scripts/compare_translations.py --directory public/locales

if [ -s "$STAGED_SRC_FILE" ]; then
  xargs -0 -n1 dirname < "$STAGED_SRC_FILE" \
  | sort -u \
  | tr '\n' '\0' \
  > "$STAGED_SRC_DIRS"
  echo "Running translation checks on staged files..."
  xargs -0 "$@" .github/workflows/scripts/translation_tag_check.py --locales-dir public/locales/en --directories < "$STAGED_SRC_DIRS"
fi


echo "Running centralized Python policy checks..."

# =============================================================================
# We are using SHAs pinned to specific commits to ensure script integrity
# and avoid executing unverified code.
# Kindly update the SHAs if  upstream scripts are modified.
#==============================================================================
# Centralized scripts directory
CENTRAL_SCRIPTS_DIR=".github-central/.github/workflows/scripts"

if [ -s "$STAGED_SRC_FILE" ]; then
  echo "Running disable statements check..."
  DISABLE_STATEMENTS_URL="https://raw.githubusercontent.com/PalisadoesFoundation/.github/main/.github/workflows/scripts/disable_statements_check.py"
  DISABLE_STATEMENTS_PATH="$CENTRAL_SCRIPTS_DIR/disable_statements_check.py"
  DISABLE_STATEMENTS_SHA="0b4184cffc6dba3607798cd54e57e99944c36cc01775cfcad68b95b713196e08"

  fetch_and_verify \
    "$DISABLE_STATEMENTS_URL" \
    "$DISABLE_STATEMENTS_PATH" \
    "$DISABLE_STATEMENTS_SHA" \
    "$SCRIPT_CACHE_HOURS"

  xargs -0 "$@" "$DISABLE_STATEMENTS_PATH" --files < "$STAGED_SRC_FILE"
fi

echo "Running docstring compliance check..."
CHECK_DOCSTRINGS_URL="https://raw.githubusercontent.com/PalisadoesFoundation/.github/main/.github/workflows/scripts/check_docstrings.py"
CHECK_DOCSTRINGS_PATH="$CENTRAL_SCRIPTS_DIR/check_docstrings.py"
CHECK_DOCSTRINGS_SHA="4e46a29d2e3223938236d522fcb917456a98ff1d7dd75972909eac7a84919065"

fetch_and_verify \
  "$CHECK_DOCSTRINGS_URL" \
  "$CHECK_DOCSTRINGS_PATH" \
  "$CHECK_DOCSTRINGS_SHA" \
  "$SCRIPT_CACHE_HOURS"

"$@" "$CHECK_DOCSTRINGS_PATH" --directories .github plugins scripts

echo "Running line count enforcement check..."
COUNTLINE_URL="https://raw.githubusercontent.com/PalisadoesFoundation/.github/main/.github/workflows/scripts/countline.py"
COUNTLINE_PATH="$CENTRAL_SCRIPTS_DIR/countline.py"
COUNTLINE_SHA="482928bed829894d1a77b656d26de1d65fa9a69cda38cd8002136903307a6a08"

fetch_and_verify \
  "$COUNTLINE_URL" \
  "$COUNTLINE_PATH" \
  "$COUNTLINE_SHA" \
  "$SCRIPT_CACHE_HOURS"

"$@" "$COUNTLINE_PATH" \
  --lines "$MAX_FILE_LINES" \
  --files ./.github/workflows/config/countline_excluded_file_list.txt


echo "Python checks completed."
