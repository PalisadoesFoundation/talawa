#!/bin/bash

# Input and Output directories
INPUT_DIR="docs/temp-docs"          # Directory containing HTML files
OUTPUT_DIR="docs/docs/auto-docs"    # Directory to store Markdown files

# Ensure output directory exists
mkdir -p "$OUTPUT_DIR"

# Function to convert HTML to Markdown
convert_html_to_md() {
    local input_dir="$1"
    local output_dir="$2"

    # Recursively iterate through input directory
    find "$input_dir" -type f -name "*.html" | while read -r html_file; do
        # Generate relative path for output
        relative_path=$(realpath --relative-to="$input_dir" "$html_file")
        
        # Remove ".html" extension and generate target file path
        target_md_file="$output_dir/${relative_path%.html}.md"
        
        # Ensure the target directory exists
        mkdir -p "$(dirname "$target_md_file")"

        # Convert HTML to Markdown using pandoc
        pandoc "$html_file" -o "$target_md_file"
        
        # Log the conversion
        echo "Converted: $html_file -> $target_md_file"
    done
}

# Call the function
convert_html_to_md "$INPUT_DIR" "$OUTPUT_DIR"

echo "All HTML files successfully converted to Markdown."
