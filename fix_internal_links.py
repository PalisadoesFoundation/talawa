import os
import re

md_folder = "docs/docs/auto-docs"


def fix_links(content, parent_folder):
    # Define the regex pattern to match links that don't start with http or https
    pattern = (
        r"\[([^\]]+)\]\((?!http|https|../)(.*)\.html(#.*)?\)"  # Matches the .html link
    )

    def replace_link(m):
        # Split the path into parts
        parts = m.group(2).split("/")
        if parts[0] == parent_folder:
            parts = parts[1:]
            parts.insert(0, ".")  # Ensure relative path works
        else:
            parts.insert(0, "..")

        # Rebuild the link and change .html to .md
        new_link = "/".join(parts) + (m.group(3) if m.group(3) else "") + ".md"
        print(f"✅ Found: {new_link}")
        return f"[{m.group(1)}]({new_link})"  # Rebuild the link with the desired format

    content = re.sub(pattern, replace_link, content)

    # Apply the fallback pattern to match links ending with .html and replace .html with .md
    fallback_pattern = (
        r"\((?!http|https)([^)]+)\.html(#.*)?\)"  # Matches only the .html link part
    )
    content = re.sub(
        fallback_pattern,
        lambda m: f"({m.group(1)}.md{m.group(2) if m.group(2) else ''})",
        content,
    )

    return content


def replace_parent_folder_links(content, parent_folder):
    pattern = r"\[([^\]]+)\]\(([^)]+)\)"

    def replace_parent_link(m):
        # Get the link URL and split it by "/"
        url_parts = m.group(2).split("/")

        # If the first part matches the parent_, replace it with "."
        if url_parts[0] == parent_folder:
            url_parts[0] = "."

        # Rebuild the link with the modified URL
        new_link = f"[{m.group(1)}]({'/'.join(url_parts)})"
        return new_link

    # Perform the substitution on the content
    content = re.sub(pattern, replace_parent_link, content)

    return content


# Walk through the files in the 'docs' folder
for root, _, files in os.walk(md_folder):
    for file in files:
        file_path = os.path.join(root, file)

        # Get the parent folder of the current file
        parent_folder = os.path.basename(root)

        # Read the file content
        with open(file_path, "r", encoding="utf-8") as f:
            content = f.read()
            # Replace .html with .md for internal links
            content = fix_links(content, parent_folder)
            # Replace parent folder reference by .
            content = replace_parent_folder_links(content, parent_folder)
            # Add title to inde.md files to ensure proper sidebar entries
            if file.endswith("index.md") and "title:" not in content:
                content = f'---\ntitle: "{parent_folder}"\n---\n\n' + content

        # Write the cleaned-up content back to the file
        with open(file_path, "w", encoding="utf-8") as f:
            f.write(content)

        print(f"✅ Fixed: {file_path}")
