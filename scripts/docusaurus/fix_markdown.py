"""This script contains functions for cleaning up markdown files.

It removes dartdoc-specific styling and fixes links.
It processes files in the specified markdown folder and applies various
transformations to clean up the content.
"""

import os
import re

md_folder = "docs/docs/auto-docs"  # Path to the docs folder


# Function to remove dartdoc added styling
def clean_markdown(content):
    """Removes dartdoc-specific styling from markdown links.

    Args:
        content (str): The markdown content to be cleaned.

    Returns:
        str: The cleaned markdown content with dartdoc-specific styling removed.
    """
    content = re.sub(r"\[([^]]+)\]\s*\{[.#][^}]+\}", r"\1", content)
    return content


def remove_curly_braces(content):
    """Removes non-nested curly braces from the markdown content.

    This function repeatedly removes top-level curly braces (those not
    containing other curly braces inside them) until none remain.

    Args:
        content (str): The markdown content to be processed.

    Returns:
        str: The content with all non-nested curly braces removed.
    """
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


# fmt: off
def flatten_nested_links(content):
    """Simplify [[reference](url)] links to [reference](url).

    Args:
        content (str): Markdown content with nested links.

    Returns:
        str: Modified content with simplified links.
    """
    # Match [[HiveKeys](link)] and turn it into [HiveKeys](link)
    def found_match(match):
        """Convert [[text](url)] links to [text](url).

        Args:
            match (re.Match): The match object containing the captured groups
                            from the regex.The first group is the text, and
                            the second is the URL.

        Returns:
            str: The modified link in the format [text](url).
        """
        return (
            f"[{match.group(1)}]({match.group(2)})"  # Return the modified link
        )

    # Apply the transformation with the found_match function
    content = re.sub(r"\[\[([^\]]+)\]\(([^)]+)\)\]", found_match, content)

    return content


def fix_nested_links(content):
    """Simplify [[reference]] links to [reference].

    Args:
        content (str): Markdown content with nested links.

    Returns:
        str: Content with simplified links.
    """
    # Match [[HiveKeys]] and turn it into [HiveKeys]
    def found_match(match):
        """Return the modified link without nested brackets.

        Args:
            match (re.Match): The match object containing the captured group.

        Returns:
            str: The link text without nested brackets.
        """
        return match.group(1)  # Return the modified link

    # Keep applying the transformation until there are no more matches
    previous_content = ""
    while previous_content != content:
        previous_content = content
        content = re.sub(r"\[\/<([^>]+)>\]", found_match, content)

    return content
# fmt: on


def fix_mdx_syntax(content):
    """Fix MDX syntax errors related to `Map/<String, Object/>` patterns.

    Args:
        content (str): Markdown content with MDX syntax errors.

    Returns:
        str: Content with fixed MDX syntax.
    """
    # Replace occurrences of Map/<something/> with escaped characters
    content = re.sub(
        r"Map/<([^,]+),\s*([^>]+)\/>", r"Map/&lt;\1, \2/&gt;", content
    )

    return content


def fix_links(content, parent_folder):
    """Update links from .html to .md and adjust relative paths.

    Args:
        content (str): The markdown content with links to be updated.
        parent_folder (str): The parent folder used to adjust relative paths.

    Returns:
        str: The updated content with fixed links.
    """
    # Define the regex pattern to match links
    # that don't start with http or https

    pattern = r"\[([^\]]+)\]\((?!http|https|../)(.*)\.html(#.*)?\)"

    def replace_link(m):
        """Replace the parent folder reference in the link with '.'

        Args:
            m (re.Match): The match object returned by the regular expression.

        Returns:
            str: The updated link with the parent folder replaced by '.'
            and the .html extension changed to .md.
        """
        # Split the path into parts
        parts = m.group(2).split("/")
        if parts[0] == parent_folder:
            parts = parts[1:]
            parts.insert(0, ".")  # Ensure relative path works
        else:
            parts.insert(0, "..")

        # Rebuild the link and change .html to .md
        new_link = "/".join(parts) + (m.group(3) if m.group(3) else "") + ".md"
        return f"[{m.group(1)}]({new_link})"  # Rebuild the link

    content = re.sub(pattern, replace_link, content)

    # Apply the fallback pattern to match links
    # ending with .html and replace .html with .md
    fallback_pattern = r"\((?!http|https)([^)]+)\.html(#.*)?\)"
    content = re.sub(
        fallback_pattern,
        lambda m: f"({m.group(1)}.md{m.group(2) if m.group(2) else ''})",
        content,
    )

    return content


def replace_parent_folder_links(content, parent_folder):
    """Replace parent folder links with relative path '.'.

    Args:
        content (str): The markdown content containing links to be updated.
        parent_folder (str): The parent folder name to be replaced.

    Returns:
        str: The updated content with replaced links.
    """
    pattern = r"\[([^\]]+)\]\(([^)]+)\)"

    def replace_parent_link(m):
        """Replace the parent folder in the link with '.'.

        Args:
            m (re.Match): The match object from the regular expression search.

        Returns:
            str: The updated link with the parent folder replaced by '.'.
        """
        # Get the link URL and split it by "/"
        url_parts = m.group(2).split("/")

        # If the first part matches the parent, replace it with "."
        if url_parts[0] == parent_folder:
            url_parts[0] = "."

        # Rebuild the link with the modified URL
        new_link = f"[{m.group(1)}]({'/'.join(url_parts)})"
        return new_link

    # Perform the substitution on the content
    content = re.sub(pattern, replace_parent_link, content)

    return content


# Loop through each Markdown file in the folder
for root, _, files in os.walk(md_folder):
    for file in files:
        file_path = os.path.join(root, file)
        # Get the parent folder of the current file
        parent_folder = os.path.basename(root)
        if not file_path.endswith(".md"):
            print(f"Deleting non-Markdown file: {file_path}")
            os.remove(file_path)  # Deletes the file
            continue  # Skip further processing for this file

        # Rename index.md files to fix duplicate routes issue
        file_rename_map = {
            "locator.md": "locator-guide.md",
            "main.md": "overview.md",
            "CustomListTile.md": "custom-list-tile.md",
        }

        # Read the file content
        with open(file_path, "r", encoding="utf-8") as f:
            content = f.read()
            """Apply a series of transformations to Markdown content.

            This function performs the following fixes:
                - Fixes Markdown inside Markdown (e.g., nested links).
                - Fixes angle brackets inside links.
                - Removes lines with Dartdoc-specific syntax.
                - Removes empty parentheses in Markdown links.
                - Normalizes Markdown links with extra parentheses.

            Args:
                content (str): The Markdown content to be processed.

            Returns:
                str: The processed Markdown content with fixes applied.
            """

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

            # Remove lines that start with three or more colons
            # (i.e., Dartdoc-specific syntax) and extend to the end of the line
            content = re.sub(r"^:::+.*$", "", content, flags=re.MULTILINE)
            # Remove lines with empty ()
            content = re.sub(r"\w+\(\)", "", content)
            # This regular expression removes unnecessary empty parentheses `()`
            # after markdown links formatted as `[[text](url)]()`. It keeps the
            # link text and URL intact while removing the trailing `()`
            # and extra outer [], which may appear due to a conversion process.
            content = re.sub(
                r"\[\[([^\]]+)\]\(([^)]+)\)\]\(\)", r"[\1](\2)", content
            )
            # Remove rest of empty ()
            content = re.sub(r"\(\)", "", content)
            # Remove # as this is not rendered correctly
            content = re.sub(
                r"(#\S+\.md)", r".md", content
            )  # #something.md -> .md
            # Remove broken anchor from
            # exceptions_critical_action_exception-library-sidebar.md
            if (
                file
                == "exceptions_critical_action_exception-library-sidebar.md"
            ):
                content = re.sub(r"/#\S+\)", r"/)", content)

            # Fix links logic

            # Replace .html with .md for internal links
            content = fix_links(content, parent_folder)
            # Replace parent folder reference by .
            content = replace_parent_folder_links(content, parent_folder)
            # Add title to inde.md files to ensure proper sidebar entries
            if file.endswith("index.md") and "title:" not in content:
                content = f'---\ntitle: "{parent_folder}"\n---\n\n' + content

            # Address isolated issues

            # Fix relative links in index.md
            if file == "index.md" and parent_folder == "auto-docs":
                content = re.sub(
                    r"\(("
                    "(CONTRIBUTING\\.md|"
                    "INSTALLATION\\.md|"
                    "CODE_OF_CONDUCT\\.md|"
                    "ISSUE_GUIDELINES\\.md|"
                    "PR_GUIDELINES\\.md|"
                    "DOCUMENTATION\\.md"
                    ")"
                    ")",
                    r"(https://github.com/PalisadoesFoundation/talawa/blob/"
                    "develop-postgres/\1)",
                    content,
                )

            # Fix link to .github/workflows/pull-request.yml in CONTRIBUTING.md
            if file == "CONTRIBUTING.md" and parent_folder == "auto-docs":
                content = re.sub(
                    r"\((\.github/workflows/pull-request\.yml)\)",
                    r"(https://github.com/PalisadoesFoundation/talawa/blob/"
                    "develop-postgres/.github/workflows/pull-request.yml)",
                    content,
                )

            # Fix lowercase conversion causing broken links
            if file in ["Message-class.md", "Message-class-sidebar.md"]:
                content = content.replace("message.md", "Message.md")
            if file in ["PinnedPost-class.md", "PinnedPost-class-sidebar.md"]:
                content = content.replace("pinnedPost.md", "PinnedPost.md")

            # Fix index.md link in search.md
            if file == "search.md" and parent_folder == "auto-docs":
                content = re.sub(
                    r"\(\.\./index.md\)", r"(./index.md)", content
                )

            # Fix relative link in CustomListTile.md
            if file == "CustomListTile.md":
                content = re.sub(
                    r"^\.\./widgets_custom_list_tile/CustomListTile/"
                    "CustomListTile.md",
                    r"./CustomListTile/CustomListTile.md",
                    content,
                )

            # Replace occurrences of links to renamed files
            content = re.sub(
                r"/(locator.md|main.md|CustomListTile.md)", "", content
            )

        # Write the cleaned-up content back to the file
        with open(file_path, "w", encoding="utf-8") as f:
            f.write(content)
        # Check if the file matches one of the specified filenames
        if file in file_rename_map:
            # Get the current file path and the new file name
            new_file_name = file_rename_map[file]
            new_file_path = os.path.join(root, new_file_name)
            # Rename the file
            os.rename(file_path, new_file_path)
