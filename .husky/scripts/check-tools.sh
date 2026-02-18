#!/usr/bin/env bash
#
# =============================================================================
# Pre-Commit Tool Availability Check
# =============================================================================
#
# This script ensures all required tools are available before running
# any pre-commit checks. Failing early avoids confusing errors later
# in the commit process.
#
# Checked Tools:
# - Core: git, node, pnpm, npx
# - Download tools: curl or wget (at least one required)
# - Checksum tools: shasum or sha256sum
# - Python: python3 or python (used via virtual environment)
#
# Design Notes:
# - Fails fast with actionable error messages
# - Supports multiple equivalent tools for portability
# - Improves cross-platform developer experience
#
# =============================================================================
set -euo pipefail

echo "Checking required tools..."

check_tool() {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "Error: Required tool '$1' is not installed."
    echo "Please install '$1' and try again."
    exit 1
  fi
}

# Core tools
check_tool git
check_tool node
check_tool pnpm
check_tool npx
check_tool "perl"

# Download tools (at least one required)
if ! command -v curl >/dev/null 2>&1 && ! command -v wget >/dev/null 2>&1; then
  echo "Error: Neither 'curl' nor 'wget' is installed."
  echo "Please install one of them to continue."
  exit 1
fi

# Checksum tools (required by precommit-python.sh)
if ! command -v shasum >/dev/null 2>&1 && ! command -v sha256sum >/dev/null 2>&1; then
  echo "Error: Neither 'shasum' nor 'sha256sum' is installed."
  echo "Please install one of them to continue."
  exit 1
fi

# Python (used via venv)
if ! command -v python3 >/dev/null 2>&1 && ! command -v python >/dev/null 2>&1; then
  echo "Error: Neither 'python3' nor 'python' is installed."
  echo "Please install Python and try again."
  exit 1
fi

echo "All required tools are available."
