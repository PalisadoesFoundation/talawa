import os
import markdownify

# Define directories
input_dir = os.path.abspath('docs/temp-docs')  # HTML source directory
output_dir = os.path.abspath('docs/docs/auto-docs')  # Markdown output directory

# Ensure output directory exists
os.makedirs(output_dir, exist_ok=True)

def convert_html_to_md(input_path, output_path):
    """Recursively convert HTML files to Markdown."""
    for root, dirs, files in os.walk(input_path):
        # Create corresponding directories in output path
        relative_path = os.path.relpath(root, input_path)
        target_dir = os.path.join(output_path, relative_path)
        os.makedirs(target_dir, exist_ok=True)

        for file in files:
            if file.endswith('.html'):
                html_file = os.path.join(root, file)
                md_file = os.path.join(target_dir, file.replace('.html', '.md'))
                
                # Read HTML, convert to Markdown, and save
                with open(html_file, 'r', encoding='utf-8') as f:
                    html_content = f.read()
                markdown_content = markdownify.markdownify(html_content, heading_style="ATX")
                
                with open(md_file, 'w', encoding='utf-8') as f:
                    f.write(markdown_content)
                print(f"Converted: {html_file} -> {md_file}")

if __name__ == "__main__":
    convert_html_to_md(input_dir, output_dir)
    print("All HTML files converted to Markdown.")
