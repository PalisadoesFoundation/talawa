#!/usr/bin/env bash
set -euo pipefail

echo "Cleaning old docs..."
rm -rf docs/docs/auto-docs
mkdir -p docs/docs/auto-docs

echo "Generating HTML docs..."
dartdoc --output docs/docs/auto-docs

echo "Converting HTML → Markdown..."
find docs/docs/auto-docs -type f -name "*.html" | while read -r file; do
  out="${file%.html}.md"
  pandoc -f html -t gfm "$file" -o "$out"
  rm "$file"
done

echo "Running Markdown cleanup..."
python3 scripts/docusaurus/fix_markdown.py docs/docs/auto-docs || true

echo "Final check..."
count=$(find docs/docs/auto-docs -name "*.md" | wc -l)
if [ "$count" -eq 0 ]; then
  echo "Error: No markdown files were generated."
  exit 1
else
  echo "✔ Markdown files generated: $count"
fi
