#!/usr/bin/env bash
#
# =============================================================================
# Python Virtual Environment Bootstrap
# =============================================================================
#
# Locates and prepares the project's Python virtual environment for use
# by pre-commit hooks and local CI parity checks.
#
# Responsibilities:
# - Detect the correct Python executable across platforms
# - Ensure dependencies are installed from requirements.txt
# - Normalize paths for Windows environments (Git Bash / Cygwin)
# - Prevent concurrent dependency installation via file locking
#
# Design Notes:
# - Supports both Unix and Windows virtualenv layouts
# - Uses locking to avoid race conditions during installs
# - Outputs the resolved Python executable path for callers
#
# =============================================================================
set -euo pipefail

REPO_ROOT=$(git rev-parse --show-toplevel)

VENV_DIR="$REPO_ROOT/venv"

if [ ! -d "$VENV_DIR" ]; then
  echo "[X] Python virtual environment not found...." >&2
  echo "Please run 'python -m venv venv' to create it." >&2
  exit 1
fi

if [ -x "$VENV_DIR/bin/python" ]; then
  VENV_PY="$VENV_DIR/bin/python"
elif [ -x "$VENV_DIR/Scripts/python.exe" ]; then
  VENV_PY="$VENV_DIR/Scripts/python.exe"
else
  echo "Error: Python executable not found in venv."
  echo "Checked: $VENV_DIR/bin/python and $VENV_DIR/Scripts/python.exe"
  exit 1
fi

LOCK_FILE=$(git rev-parse --git-path venv-setup.lock)
exec 9>"$LOCK_FILE"

if command -v flock >/dev/null 2>&1; then
  flock 9
else
  echo "Warning: flock not available, proceeding without lock" >&2
fi

# Install deps
"$VENV_PY" -m pip install -q --disable-pip-version-check -r "$REPO_ROOT/.github/workflows/requirements.txt"

if command -v cygpath >/dev/null 2>&1; then
  VENV_PY=$(cygpath -u "$VENV_PY")
fi

echo "$VENV_PY"