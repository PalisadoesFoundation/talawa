import os
import re

md_folder = "docs/docs/auto-docs"


# Function to remove dartdoc added styling
def clean_markdown(content):
    content = re.sub(r"\[([^]]+)\]\s*\{[.#][^}]+\}", r"\1", content)
    return content


def remove_curly_braces(content):
    # Loop to repeatedly remove non-nested curly braces until none remain
    while True:
        # Match top-level curly braces (not nested)
        new_content = re.sub(r"\{(?![^{}]*\{)[^}]*\}", "", content)

        # If the content has not changed, stop the loop
        if new_content == content:
            break

        # Otherwise, update content and continue removing
        content = new_content

    return content


# Loop through each Markdown file in the folder
for root, _, files in os.walk(md_folder):
    for file in files:
        file_path = os.path.join(root, file)

        # Read the file content
        with open(file_path, "r", encoding="utf-8") as f:
            content = f.read()

        # If file is `index.md`
        if file.endswith("index.md"):
            content = content.replace(
                "\\", "/"
            )  # Convert backslashes to forward slashes

        content = clean_markdown(content)
        # Remove any content inside curly braces as docusaurus is not able to render {}
        content = remove_curly_braces(content)
        # Remove lines that start with three or more colons (i.e., Dartdoc-specific syntax) and extend to the end of the line
        content = re.sub(r"^:::+.*$", "", content, flags=re.MULTILINE)
        # Remove lines with empty ()
        content = re.sub(r"\w+\(\)", "", content)
        # This regular expression removes unnecessary empty parentheses `()`
        # after markdown links formatted as `[[text](url)]()`. It keeps the
        # link text and URL intact while removing the trailing `()` and extra outer [], which
        # may appear due to a conversion process.
        content = re.sub(r"\[\[([^\]]+)\]\(([^)]+)\)\]\(\)", r"[\1](\2)", content)

        # Write the cleaned-up content back to the file
        with open(file_path, "w", encoding="utf-8") as f:
            f.write(content)
