#!/bin/bash

# Run the Flutter command to generate the docs
# Determine the flutter command
if command -v fvm &> /dev/null; then
    echo "FVM detected, using 'fvm flutter'..."
    FLUTTER_CMD="fvm flutter"
else
    echo "Using standard 'flutter' command..."
    FLUTTER_CMD="flutter"
fi

# Run dart_doc_markdown to generate the docs
echo "Generating documentation using dart_doc_markdown..."
$FLUTTER_CMD pub global run dart_doc_markdown . docs/docs/auto-docs

# Fix the markdown using the Python scripts
echo "Fixing markdown..."

# Remove test documentation
echo "Removing test documentation..."
find docs/docs/auto-docs -type d -name "*_test" -exec rm -rf {} +
find docs/docs/auto-docs -type f -name "*_test.md" -delete

python3 scripts/docusaurus/fix_markdown.py

echo "Documentation generation completed."
