#!/bin/bash

# Run the Flutter command to generate the docs
echo "Generating Flutter documentation..."
flutter pub global run dartdoc --output docs/docs/auto-docs lib

# Convert HTML files to Markdown
echo "Converting HTML files to Markdown..."
find docs/docs/auto-docs -type f -name "*.html" | while read file; do
  output_dir="$(dirname "$file")"
  mkdir -p "$output_dir"

  # Ensure filename case is preserved
  filename=$(basename "$file" .html)

  # Convert HTML to Markdown using pandoc
  pandoc -f html -t markdown -o "$output_dir/$filename.md" "$file"

  # Delete the original HTML file after conversion
  rm "$file"
done

# Fix the markdown using the Python scripts
echo "Fixing markdown..."
python scripts/docusaurus/fix_markdown.py

echo "Documentation generation completed."
