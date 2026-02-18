#!/usr/bin/env bash
#
# =============================================================================
# Pre-Commit Node.js Checks
# =============================================================================
#
# Runs all Node.js-related validations on staged files to ensure
# code quality and CI parity before commits are created.
#
# Checks include:
# - Documentation generation and ToC updates
# - Code formatting and linting
# - TypeScript type checking
# - i18n validation on staged files
# - Dependency and dead-code analysis (Knip)
# - Policy checks (MinIO, mocks, localStorage usage)
#
# Design Notes:
# - Exits early if no staged source files are provided
# - Uses pnpm for consistency with project tooling
# - Keeps behavior aligned with CI to avoid surprises
#
# =============================================================================
set -euo pipefail

PIDS=()
cleanup_bg() {
  for pid in "${PIDS[@]:-}"; do
    kill "$pid" 2>/dev/null || true
  done
}
trap cleanup_bg EXIT

STAGED_SRC_FILE="$1"

[ ! -s "$STAGED_SRC_FILE" ] && {
  echo "Skipping Node.js checks (no staged source files)..."
  exit 0
}

echo "Running Node.js pre-commit checks..."

pnpm exec lint-staged
pnpm run generate-docs &
PID_DOCS=$!
PIDS+=("$PID_DOCS")

wait "$PID_DOCS"; STATUS_DOCS=$?
if [ "$STATUS_DOCS" -ne 0 ]; then
  echo "Background task failure"
  exit 1
fi

pnpm knip --include files,exports &
PID_KNIP1=$!
PIDS+=("$PID_KNIP1")

pnpm knip --config knip.deps.json --include dependencies &
PID_KNIP2=$!
PIDS+=("$PID_KNIP2")

wait "$PID_KNIP1"; STATUS_KNIP1=$?
wait "$PID_KNIP2"; STATUS_KNIP2=$?
if [ "$STATUS_KNIP1" -ne 0 ] || [ "$STATUS_KNIP2" -ne 0 ]; then
  echo "Background task failure"
  exit 1
fi

git add docs/

echo "Node.js checks completed successfully."
