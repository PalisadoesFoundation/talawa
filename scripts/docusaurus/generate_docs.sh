#!/bin/bash
set -e
set -o pipefail

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
# Check if dart_doc_markdown is installed and activated
if ! $FLUTTER_CMD pub global list | grep -q "dart_doc_markdown"; then
    echo "Error: dart_doc_markdown is not activated."
    echo "Please run: $FLUTTER_CMD pub global activate dart_doc_markdown"
    exit 1
fi

echo "Generating documentation using dart_doc_markdown..."
$FLUTTER_CMD pub global run dart_doc_markdown . docs/docs/auto-docs
EXIT_CODE=$?
if [ $EXIT_CODE -ne 0 ]; then
    echo "Error: Command '$FLUTTER_CMD pub global run dart_doc_markdown . docs/docs/auto-docs' failed with exit code $EXIT_CODE" >&2
    exit $EXIT_CODE
fi

# Fix the markdown using the Python scripts
echo "Fixing markdown..."

# Remove test documentation
echo "Removing test documentation..."
if [ -d "docs/docs/auto-docs" ]; then
    # Safe removal using -depth to handle nested structures correctly
    find docs/docs/auto-docs -depth -type d -name "*_test" -exec rm -rf {} \;
    find docs/docs/auto-docs -type f -name "*_test.md" -delete
else
    echo "Warning: docs/docs/auto-docs directory not found"
fi

FIX_SCRIPT="scripts/docusaurus/fix_markdown.py"
if [ ! -f "$FIX_SCRIPT" ]; then
    echo "Error: Python script '$FIX_SCRIPT' not found." >&2
    exit 1
fi

python3 "$FIX_SCRIPT"
FIX_EXIT_CODE=$?
if [ $FIX_EXIT_CODE -ne 0 ]; then
    echo "Error: Python script '$FIX_SCRIPT' failed with exit code $FIX_EXIT_CODE" >&2
    exit $FIX_EXIT_CODE
fi

echo "Documentation generation completed."
