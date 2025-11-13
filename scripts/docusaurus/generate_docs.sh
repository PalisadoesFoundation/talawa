#!/bin/bash
# ============================================
# Generate and clean documentation using global dartdoc
# ============================================

set -e  # Exit on error
trap 'echo " Error occurred on line $LINENO. Aborting documentation generation." >&2' ERR
echo "Cleaning old docs..."
rm -rf docs/docs/auto-docs

echo "Generating Dart documentation using global dartdoc..."
dartdoc --input=./ --output=docs/docs/auto-docs

echo "Converting HTML files to Markdown..."
find docs/docs/auto-docs -type f -name "*.html" | while read -r file; do
  output_dir="$(dirname "$file")"
  filename=$(basename "$file" .html)
  pandoc -f html -t gfm -o "$output_dir/$filename.md" "$file"
  rm "$file"
done

echo "Cleaning extra files and fixing Markdown..."
python3 scripts/docusaurus/fix_markdown.py || {
  echo "Warning: fix_markdown.py not found or failed — skipping cleanup."
}
echo "Documentation generated and cleaned successfully!"
