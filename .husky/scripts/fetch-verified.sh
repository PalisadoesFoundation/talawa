#!/usr/bin/env bash
#
# =============================================================================
# Talawa Plugin – Fetch & Verify Remote Scripts
# =============================================================================
#
# Thin helper to securely fetch and cache external CI/CD scripts.
#
# Responsibilities:
# - Download remote scripts from a trusted source
# - Verify integrity using a pinned SHA-256 checksum
# - Cache verified scripts locally for reuse
#
# Design Notes:
# - Intentionally minimal to avoid scope creep
# - Fails fast on download or verification errors
# - Shared by Husky pre-commit hooks and CI tooling
#
# =============================================================================

set -euo pipefail

if ! command -v curl >/dev/null 2>&1 && ! command -v wget >/dev/null 2>&1; then
  echo "Error: curl or wget is required to fetch remote scripts." >&2
  exit 1
fi

if ! command -v sha256sum >/dev/null 2>&1 && ! command -v shasum >/dev/null 2>&1; then
  echo "Error: sha256sum or shasum is required for checksum verification." >&2
  exit 1
fi

fetch_and_verify() {
  local url="$1"
  local dest="$2"
  local expected_sha="$3"
  local cache_hours="${4:-24}"

  if [ -z "$url" ] || [ -z "$dest" ] || [ -z "$expected_sha" ]; then
    echo "Error: fetch_and_verify requires url, dest, and expected_sha" >&2
    exit 1
  fi

  mkdir -p "$(dirname "$dest")"

  local NEEDS_DOWNLOAD=true
  local FILE_MOD_TIME=""
  local OS_TYPE
  OS_TYPE="$(uname -s)"

  if [ -f "$dest" ]; then
    case "$OS_TYPE" in
      Darwin*)
        FILE_MOD_TIME=$(stat -f %m "$dest" 2>/dev/null || true)
        ;;
      Linux*)
        FILE_MOD_TIME=$(stat -c %Y "$dest" 2>/dev/null || true)
        ;;
      MINGW*|MSYS*|CYGWIN*)
            if command -v powershell.exe >/dev/null 2>&1; then
                local win_path
                # shellcheck disable=SC2001
                win_path=$(cygpath -w "$dest" 2>/dev/null \
                || echo "$dest" | sed 's|^/\([a-z]\)/|\U\1:/|')

                FILE_MOD_TIME=$(powershell.exe -NoProfile -Command \
                "([DateTimeOffset](Get-Item -LiteralPath \"${win_path}\").LastWriteTimeUtc).ToUnixTimeSeconds()" \
                2>/dev/null | tr -d '\r' || true)
            fi
            ;;
      *)
        echo "Warning: Unsupported OS ($OS_TYPE); caching disabled. Script will be downloaded on every run." >&2
        FILE_MOD_TIME=""
        ;;
    esac

    if [ -n "$FILE_MOD_TIME" ]; then
      local now
      now=$(date +%s 2>/dev/null || python3 -c 'import time; print(int(time.time()))' 2>/dev/null || python -c 'import time; print(int(time.time()))')
      local age_hours=$(( (now - FILE_MOD_TIME) / 3600 ))
      if [ "$age_hours" -lt "$cache_hours" ]; then
        NEEDS_DOWNLOAD=false
      fi
    fi
  fi

  if [ "$NEEDS_DOWNLOAD" = false ]; then
    local cached_sha
    if command -v sha256sum >/dev/null 2>&1; then
      cached_sha=$(sha256sum "$dest" | awk '{print $1}')
    elif command -v shasum >/dev/null 2>&1; then
      cached_sha=$(shasum -a 256 "$dest" | awk '{print $1}')
    else
      echo "Error: sha256sum or shasum is required" >&2
      exit 1
    fi

    if [ "$cached_sha" != "$expected_sha" ]; then
      echo "Warning: cached checksum mismatch; re-downloading" >&2
      NEEDS_DOWNLOAD=true
    fi
  fi

  if [ "$NEEDS_DOWNLOAD" = true ]; then
    echo "Fetching $(basename "$dest")..."

    local tmp
    tmp="$(mktemp -t fetch.XXXXXX)"
    trap 'rm -f "$tmp"' RETURN

    if command -v curl >/dev/null 2>&1; then
      curl -sSfL "$url" -o "$tmp"
    elif command -v wget >/dev/null 2>&1; then
      wget -q -O "$tmp" "$url"
    else
      echo "Error: curl or wget is required" >&2
      exit 1
    fi

    local actual_sha
    if command -v sha256sum >/dev/null 2>&1; then
      actual_sha=$(sha256sum "$tmp" | awk '{print $1}')
    elif command -v shasum >/dev/null 2>&1; then
      actual_sha=$(shasum -a 256 "$tmp" | awk '{print $1}')
    else
      echo "Error: sha256sum or shasum is required" >&2
      rm -f "$tmp"
      exit 1
    fi

    if [ "$actual_sha" != "$expected_sha" ]; then
      echo "Security error: checksum mismatch for $dest" >&2
      echo "Expected: $expected_sha" >&2
      echo "Actual:   $actual_sha" >&2
      rm -f "$tmp"
      exit 1
    fi

    mv "$tmp" "$dest"
    chmod +x "$dest"
  fi
}