#!/bin/bash

# Define directories for source HTML and output Markdown
SOURCE_DIR="docs/temp-docs"
OUTPUT_DIR="docs/docs/auto-docs"

# Ensure output directory exists
mkdir -p "$OUTPUT_DIR"

# Find all HTML files recursively and convert them
find "$SOURCE_DIR" -type f -name "*.html" | while read -r html_file; do
  # Get the relative path by stripping out the base SOURCE_DIR part
  relative_path="${html_file#$SOURCE_DIR/}"

  relative_path_stripped="${relative_path#lib/}"

  # Remove the file extension (.html) to get the base name
  base_filename="${relative_path_stripped%.html}.md"

  # Create the corresponding output file path in OUTPUT_DIR
  output_file="$OUTPUT_DIR/$base_filename"

  # Ensure subdirectories in OUTPUT_DIR exist
  mkdir -p "$(dirname "$output_file")"

  # Convert HTML to Markdown using pandoc
  echo "Converting $html_file to $output_file"
  pandoc -s "$html_file" -o "$output_file"
done

echo "HTML to Markdown conversion complete."
