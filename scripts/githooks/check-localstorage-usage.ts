#!/usr/bin/env node

import { readFileSync, existsSync } from 'fs';
import path from 'path';
import { execSync } from 'child_process';
import type { ExecSyncOptionsWithStringEncoding } from 'child_process';

const args: string[] = process.argv.slice(2);
const scanEntireRepo: boolean = args.includes('--scan-entire-repo');

const containsSkipComment = (file: string): boolean => {
  try {
    const content = readFileSync(file, 'utf-8');
    return content.includes('// SKIP_LOCALSTORAGE_CHECK');
  } catch (error) {
    console.error(
      `Error reading file ${file}:`,
      error instanceof Error ? error.message : error,
    );
    return false;
  }
};

const getModifiedFiles = (): string[] => {
  try {
    const options: ExecSyncOptionsWithStringEncoding = { encoding: 'utf-8' };

    if (scanEntireRepo) {
      const result = execSync('git ls-files | grep ".tsx\\?$"', options);
      return result.trim().split('\n');
    }

    const result = execSync('git diff --cached --name-only', options);
    return result.trim().split('\n');
  } catch (error) {
    console.error(
      'Error fetching modified files:',
      error instanceof Error ? error.message : error,
    );
    process.exit(1);
  }
  return [];
};

const files: string[] = getModifiedFiles();
const filesWithLocalStorage: string[] = [];

const checkLocalStorageUsage = (file: string): void => {
  if (!file) {
    return;
  }

  const fileName = path.basename(file);

  // Skip files with specific names or containing a skip comment
  if (
    fileName === 'check-localstorage-usage.ts' || // Updated extension
    fileName === 'useLocalstorage.test.ts' ||
    fileName === 'useLocalstorage.ts' ||
    containsSkipComment(file)
  ) {
    console.log(`Skipping file: ${file}`);
    return;
  }

  try {
    if (existsSync(file)) {
      const content = readFileSync(file, 'utf-8');

      if (
        content.includes('localStorage.getItem') ||
        content.includes('localStorage.setItem') ||
        content.includes('localStorage.removeItem')
      ) {
        filesWithLocalStorage.push(file);
      }
    } else {
      console.log(`File ${file} does not exist.`);
    }
  } catch (error) {
    console.error(
      `Error reading file ${file}:`,
      error instanceof Error ? error.message : error,
    );
  }
};

files.forEach(checkLocalStorageUsage);

if (filesWithLocalStorage.length > 0) {
  console.error('\x1b[31m%s\x1b[0m', '\nError: Found usage of localStorage');
  console.error('\nFiles with localStorage usage:');
  filesWithLocalStorage.forEach((file) => console.error(file));

  console.info(
    '\x1b[34m%s\x1b[0m',
    '\nInfo: Consider using custom hook functions.',
  );
  console.info(
    'Please use the getItem, setItem, and removeItem functions provided by the custom hook useLocalStorage.\n',
  );

  process.exit(1);
}
