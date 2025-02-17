import os
import re

md_folder = "docs/docs/auto-docs"  # Path to the docs folder


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


def flatten_nested_links(content):
    """Simplify [[alphabetical]] links to [alphabetical]."""

    # Match [[HiveKeys]] and turn it into [HiveKeys]
    def print_match(match):
        print(f"Found match: {match.group(0)}")  # Print only the matched content
        return f"[{match.group(1)}"  # Return the modified link

    # Apply the transformation with the print_match function to print the matches
    content = re.sub(r"\[\[([a-zA-Z]+)\]", print_match, content)

    return content


def fix_nested_links(content):
    """Simplify [[alphabetical]] links to [alphabetical]."""

    # Match [[HiveKeys]] and turn it into [HiveKeys]
    def print_match(match):
        print(f"Found match: {match.group(0)}")  # Print only the matched content
        return match.group(1)  # Return the modified link

    # Keep applying the transformation until there are no more matches
    previous_content = ""
    while previous_content != content:
        previous_content = content
        content = re.sub(r"\[\/<([^>]+)>\]", print_match, content)

    return content


def fix_mdx_syntax(content):
    """Fix MDX syntax errors related to `Map/<String, Object/>` patterns."""
    # Replace occurrences of Map/<something/> with escaped characters
    content = re.sub(r"Map/<([^,]+),\s*([^>]+)\/>", r"Map/&lt;\1, \2/&gt;", content)

    return content


# Loop through each Markdown file in the folder
for root, _, files in os.walk(md_folder):
    for file in files:
        file_path = os.path.join(root, file)

        # Read the file content
        with open(file_path, "r", encoding="utf-8") as f:
            content = f.read()

        # If file is `index.md`, flatten nested `[[...]]` links first
        if file.endswith("index.md"):
            content = content.replace(
                "\\", "/"
            )  # Convert backslashes to forward slashes
            content = fix_nested_links(content)
            content = flatten_nested_links(content)
            content = fix_mdx_syntax(content)

        content = clean_markdown(content)

        # Fix nested {{...}} braces
        content = remove_curly_braces(content)

        # Fix Markdown inside Markdown (one-time pass)
        content = re.sub(r"(\[[^\]]+\])(\[[^\]]+\])", r"\1\2", content)

        # Fix Angle Brackets (`<` and `>` inside links)
        content = re.sub(r"<(\[[^\]]+\]\([^\)]+\))>", r"\1", content)

        # Remove lines that start with three or more colons (i.e., Dartdoc-specific syntax) and extend to the end of the line
        content = re.sub(r"^:::+.*$", "", content, flags=re.MULTILINE)
        # Remove lines with empty ()
        content = re.sub(r"\w+\(\)", "", content)
        # This regular expression removes unnecessary empty parentheses `()`
        # after markdown links formatted as `[[text](url)]()`. It keeps the
        # link text and URL intact while removing the trailing `()` and extra outer [], which
        # may appear due to a conversion process.
        content = re.sub(r"\[\[([^\]]+)\]\(([^)]+)\)\]\(\)", r"[\1](\2)", content)
        # Remove rest of empty ()
        content = re.sub(r"\(\)", "", content)
        # Remove # as this is not rendered correctly
        content = re.sub(r"#([^ )]+\.md)", r".md", content)  # #something.md -> .md
        content = re.sub(r"#([^ )]+)", r")", content)  # #something) -> )
        content = re.sub(r"/#([^ ]+)", r"/", content)  # /something -> /

        # Write the cleaned-up content back to the file
        with open(file_path, "w", encoding="utf-8") as f:
            f.write(content)

        print(f"✅ Fixed: {file_path}")
