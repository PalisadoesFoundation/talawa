import fs from 'fs/promises'; // Import fs.promises for async operations
import path from 'path';

// List of files to skip
const filesToSkip = [
    'index.tsx', 
    'EventActionItems.tsx',
    'OrgPostCard.tsx',
    'UsersTableItem.tsx',
    'FundCampaignPledge.tsx'
];

// Recursively find all .tsx files, excluding files listed in filesToSkip
async function findTsxFiles(dir) {
  let results = [];
  try {
    const list = await fs.readdir(dir);
    for (const file of list) {
      const filePath = path.join(dir, file);
      const stat = await fs.stat(filePath);
      if (stat.isDirectory()) {
        results = results.concat(await findTsxFiles(filePath));
      } else if (
        filePath.endsWith('.tsx') &&
        !filePath.endsWith('.test.tsx') &&
        !filePath.endsWith('.spec.tsx') &&
        !filesToSkip.includes(path.relative(dir, filePath))
      ) {
        results.push(filePath);
      }
    }
  } catch (err) {
    console.error(`Error reading directory ${dir}: ${err.message}`);
  }
  return results;
}

// Check if a file contains at least one TSDoc comment
async function containsTsDocComment(filePath) {
  try {
    const content = await fs.readFile(filePath, 'utf8');
    return /\/\*\*[\s\S]*?\*\//.test(content);
  } catch (err) {
    console.error(`Error reading file ${filePath}: ${err.message}`);
    return false;
  }
}

// Main function to run the validation
async function run() {
  const dir = process.argv[2] || './src'; // Allow directory path as a command-line argument
  const files = await findTsxFiles(dir);
  const filesWithoutTsDoc = [];

  for (const file of files) {
    if (!await containsTsDocComment(file)) {
      filesWithoutTsDoc.push(file);
    }
  }

  if (filesWithoutTsDoc.length > 0) {
    filesWithoutTsDoc.forEach(file => {
      console.error(`No TSDoc comment found in file: ${file}`);
    });
    process.exit(1);
  }
}

run();