import fs from 'fs';
import path from 'path';

const docsDir = path.resolve('./docs/docs/auto-docs');

function replaceLinks(dir) {
  const files = fs.readdirSync(dir);
  files.forEach((file) => {
    const filePath = path.join(dir, file);
    if (fs.lstatSync(filePath).isDirectory()) {
      replaceLinks(filePath);
    } else if (file.endsWith('.md')) {
      let content = fs.readFileSync(filePath, 'utf8');

      // Replace any README.md links with root directory ("/")
      content = content.replace(/\[.*?\]\((.*?)README\.md\)/g, (match) => {
        return '[Plugin Docs](/)'; // Redirect broken links to the root
      });

      fs.writeFileSync(filePath, content, 'utf8');
    }
  });
}

replaceLinks(docsDir);
