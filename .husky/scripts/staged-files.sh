#!/usr/bin/env bash
#
# Shared helpers for staged file detection and filtering.
# Used by pre-commit hooks to ensure consistent staged-file handling
# across macOS, Linux, and Windows (Git Bash).
#

set -euo pipefail

_STAGED_CACHE_FILE=""

cleanup_staged_cache() {
  [ -n "${_STAGED_CACHE_FILE:-}" ] && rm -f "$_STAGED_CACHE_FILE"
}

get_staged_files() {
  include="${1:-}"
  exclude="${2:-}"

  if [ -z "$_STAGED_CACHE_FILE" ]; then
    _STAGED_CACHE_FILE=$(mktemp)
    git diff --cached -z --name-only --diff-filter=ACMRT > "$_STAGED_CACHE_FILE" || true
  fi

  if [ -z "$include" ] && [ -z "$exclude" ]; then
    cat "$_STAGED_CACHE_FILE"
    return
  fi

  inc="$include"
  exc="$exclude"

  if [ -n "$include" ] && [ -n "$exclude" ]; then
    inc="$inc" exc="$exc" perl -0 -ne '
      for (split /\0/) {
        print "$_\0" if /$ENV{inc}/ && !/$ENV{exc}/
      }
    ' "$_STAGED_CACHE_FILE" || true
    return
  fi

  if [ -n "$include" ]; then
    inc="$inc" perl -0 -ne '
      for (split /\0/) {
        print "$_\0" if /$ENV{inc}/
      }
    ' "$_STAGED_CACHE_FILE" || true
    return
  fi

  exc="$exc" perl -0 -ne '
    for (split /\0/) {
      print "$_\0" if !/$ENV{exc}/
    }
  ' "$_STAGED_CACHE_FILE" || true
}
