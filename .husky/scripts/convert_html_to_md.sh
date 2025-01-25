#!/bin/bash

# Define directories for source HTML and output Markdown
SOURCE_DIR="docs/temp-docs"
OUTPUT_DIR="docs/docs/auto-docs"

# Ensure output directory exists
mkdir -p "$OUTPUT_DIR"

# Find all HTML files recursively and convert them
find "$SOURCE_DIR" -type f -name "*.html" | while read -r html_file; do
  # Extract the base filename without the extension
  base_filename=$(basename "$html_file" .html)

  # Create corresponding output file path
  output_file="$OUTPUT_DIR/$base_filename.md"

  # Convert HTML to Markdown using pandoc
#   echo "Converting $html_file to $output_file"
  pandoc -s "$html_file" -o "$output_file"
done

echo "HTML to Markdown conversion complete."
