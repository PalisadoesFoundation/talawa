import fs from 'fs';
import path from 'path';

const docsDir = path.resolve('./docs/docs/auto-docs');
const mainRepoUrl =
  'https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/';

function replaceRepoUrl(dir) {
  const files = fs.readdirSync(dir);
  files.forEach((file) => {
    const filePath = path.join(dir, file);
    if (fs.lstatSync(filePath).isDirectory()) {
      replaceRepoUrl(filePath);
    } else if (file.endsWith('.md')) {
      let content = fs.readFileSync(filePath, 'utf8');

      // Replace any repository URL before the "src" directory with the main repository URL
      content = content.replace(
        /https:\/\/github\.com\/[^/]+\/[^/]+\/(blob|tree)\/[^/]+\//g,
        mainRepoUrl,
      );

      fs.writeFileSync(filePath, content, 'utf8');
    }
  });
}

replaceRepoUrl(docsDir);
