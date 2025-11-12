#!/bin/bash
# ============================================
# Generate and clean documentation (GLOBAL dartdoc)
# ============================================

echo "Cleaning old docs..."
rm -rf docs/docs/auto-docs

echo "Generating Dart documentation using global dartdoc..."
# Use globally installed dartdoc instead of local pub run
dartdoc --output docs/docs/auto-docs --exclude-packages=test,build

# Check if dartdoc succeeded
if [ $? -ne 0 ]; then
  echo "❌ Dartdoc generation failed. Please check errors above."
  exit 1
fi

echo "Converting HTML files to Markdown..."
find docs/docs/auto-docs -type f -name "*.html" | while read file; do
  output_dir="$(dirname "$file")"
  filename=$(basename "$file" .html)
  pandoc -f html -t markdown -o "$output_dir/$filename.md" "$file"
  rm "$file"
done

echo "Cleaning markdown..."
python3 scripts/docusaurus/fix_markdown.py

echo "✅ Documentation generated and cleaned successfully!"

