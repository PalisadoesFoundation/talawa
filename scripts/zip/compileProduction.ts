// scripts/zip/compileProduction.ts
import {
  createWriteStream,
  existsSync,
  mkdirSync,
  readdirSync,
  statSync,
  rmSync,
  writeFileSync,
  cpSync,
  copyFileSync,
  type Stats,
} from 'node:fs';
import { join, sep } from 'node:path';
import { execFileSync } from 'node:child_process';
import archiver from 'archiver';
import fg from 'fast-glob';
import type { ArchiveWarning } from './types.js';

interface PluginInfo {
  name: string;
  path: string; // after compileForProduction, this path contains compiled output
  hasAdmin: boolean;
  hasApi: boolean;
}

type ZipRoot = {
  /** directory to zip from; defaults to plugin.path */
  root?: string;
  /** optional subtrees to include explicitly; when omitted we pick based on hasAdmin/hasApi & top-level files */
  includeGlobs?: string[];
};

const IGNORE_BASENAMES = new Set(['.DS_Store', 'Thumbs.db']);

const IGNORE_DIRS = new Set([
  '__MACOSX',
  '.git',
  '.svn',
  '.hg',
  'node_modules', // exclude runtime deps by default; flip if your runtime needs them
  'dist', // exclude stray build dirs unless they are your root; see below
  'build',
  'src',
  'test',
  'tests',
  '__tests__',
]);

// Allowed file types for runtime
const ALLOWED_EXT_RE =
  /\.(?:js|cjs|mjs|json|node|wasm|css|scss|sass|map\.json|svg|png|jpg|jpeg|gif|webp|ico|ttf|otf|woff|woff2|eot|html|txt)$/i;

// Explicitly exclude sources & maps
const EXCLUDE_FILE_RE = /\.(?:ts|tsx|mts|cts|d\.ts|map)$/i; // keeps out .map (JS maps) too

function shouldIgnoreDir(name: string) {
  return IGNORE_DIRS.has(name);
}

function shouldIgnoreFile(base: string) {
  if (IGNORE_BASENAMES.has(base)) return true;
  if (EXCLUDE_FILE_RE.test(base)) return true;
  // If you want to allow .map for debugging, comment the EXCLUDE_FILE_RE test above.
  return false;
}

function listFilesRecursive(
  root: string,
  baseInZip: string,
): Array<{
  fsPath: string;
  zipPath: string;
  stats: ReturnType<typeof statSync>;
}> {
  const out: Array<{
    fsPath: string;
    zipPath: string;
    stats: ReturnType<typeof statSync>;
  }> = [];
  const stack: Array<{ dir: string; prefix: string }> = [
    { dir: root, prefix: baseInZip },
  ];

  while (stack.length) {
    const { dir, prefix } = stack.pop()!;
    const entries = readdirSync(dir, { withFileTypes: true });

    for (const ent of entries) {
      const name = ent.name;
      const fsPath = join(dir, name);

      if (ent.isDirectory()) {
        if (shouldIgnoreDir(name)) continue;
        const zipPath =
          (prefix ? `${prefix}/` : '') +
          name.replace(
            new RegExp(sep.replace(/[.*+?^${}()|[\]\\]/g, '\\$&'), 'g'),
            '/',
          );
        stack.push({ dir: fsPath, prefix: zipPath });
      } else if (ent.isFile()) {
        if (shouldIgnoreFile(name)) continue;
        if (!ALLOWED_EXT_RE.test(name)) continue; // only runtime/asset files
        const stats = statSync(fsPath);
        const zipPath =
          (prefix ? `${prefix}/` : '') +
          name.replace(
            new RegExp(sep.replace(/[.*+?^${}()|[\]\\]/g, '\\$&'), 'g'),
            '/',
          );
        out.push({ fsPath, zipPath, stats });
      }
    }
  }

  return out;
}

export async function compileForProduction(
  plugin: PluginInfo,
  skipTypeCheck: boolean = false,
): Promise<void> {
  // Create backup of original plugin
  const backupPath = `${plugin.path}.backup`;
  if (existsSync(backupPath)) {
    rmSync(backupPath, { recursive: true, force: true });
  }
  cpSync(plugin.path, backupPath, { recursive: true });

  try {
    // Compile Admin module (React/JSX)
    if (plugin.hasAdmin && existsSync(join(plugin.path, 'admin'))) {
      const adminPath = join(plugin.path, 'admin');
      const adminTsConfig = join(adminPath, 'tsconfig.json');

      // Create temporary tsconfig for admin compilation
      const adminTsConfigContent = {
        compilerOptions: {
          target: 'ES2020',
          lib: ['DOM', 'DOM.Iterable', 'ES6'],
          allowJs: true,
          skipLibCheck: true,
          esModuleInterop: true,
          allowSyntheticDefaultImports: true,
          strict: skipTypeCheck ? false : true,
          forceConsistentCasingInFileNames: true,
          noFallthroughCasesInSwitch: true,
          module: 'ESNext',
          moduleResolution: 'node',
          resolveJsonModule: true,
          isolatedModules: true,
          noEmit: false,
          jsx: 'react-jsx',
          outDir: './dist',
          noEmitOnError: skipTypeCheck ? false : true,
        },
        include: ['**/*.ts', '**/*.tsx'],
        exclude: ['node_modules', 'dist'],
      };

      // Write temporary tsconfig
      writeFileSync(
        adminTsConfig,
        JSON.stringify(adminTsConfigContent, null, 2),
      );

      try {
        // Compile admin TypeScript files
        console.log('Compiling admin module: npx tsc');

        try {
          execFileSync('npx', ['tsc'], { cwd: adminPath, stdio: 'inherit' });
        } catch (compileError) {
          if (skipTypeCheck) {
            console.warn(
              'TypeScript compilation failed, but continuing due to skip type check option',
            );
            // Create dist directory manually if compilation failed
            const distPath = join(adminPath, 'dist');
            if (!existsSync(distPath)) {
              mkdirSync(distPath, { recursive: true });
            }
            // Copy TypeScript files as JavaScript (fallback)
            const tsFiles = await fg(['**/*.ts', '**/*.tsx'], {
              cwd: adminPath,
              ignore: ['node_modules/**', 'dist/**'],
            });
            for (const file of tsFiles) {
              const srcPath = join(adminPath, file);
              const destFile = file.replace(/\.tsx?$/, (match) =>
                match === '.tsx' ? '.jsx' : '.js',
              );
              const destPath = join(distPath, destFile);
              const destDir = join(destPath, '..');
              if (!existsSync(destDir)) {
                mkdirSync(destDir, { recursive: true });
              }
              copyFileSync(srcPath, destPath);
            }
          } else {
            throw compileError;
          }
        }

        // Copy non-TS files to dist
        const distPath = join(adminPath, 'dist');
        if (existsSync(distPath)) {
          // Copy non-TS files to dist using fast-glob
          const assetFiles = await fg(
            [
              '**/*.json',
              '**/*.css',
              '**/*.scss',
              '**/*.svg',
              '**/*.png',
              '**/*.jpg',
              '**/*.jpeg',
              '**/*.gif',
              '**/*.webp',
            ],
            { cwd: adminPath, ignore: ['node_modules/**', 'dist/**'] },
          );
          for (const file of assetFiles) {
            const srcPath = join(adminPath, file);
            const destPath = join(distPath, file);
            const destDir = join(destPath, '..');
            if (!existsSync(destDir)) {
              mkdirSync(destDir, { recursive: true });
            }
            copyFileSync(srcPath, destPath);
          }

          // Move compiled files back to original structure (no dist folder)
          const moveFiles = (srcDir: string, destDir: string) => {
            const entries = readdirSync(srcDir, { withFileTypes: true });
            for (const entry of entries) {
              const srcPath = join(srcDir, entry.name);
              const destPath = join(destDir, entry.name);

              if (entry.isDirectory()) {
                if (!existsSync(destPath)) {
                  mkdirSync(destPath, { recursive: true });
                }
                moveFiles(srcPath, destPath);
              } else {
                copyFileSync(srcPath, destPath);
              }
            }
          };

          // Move all files from dist back to admin directory
          moveFiles(distPath, adminPath);

          // Remove the dist directory
          rmSync(distPath, { recursive: true, force: true });

          // Remove original TypeScript files
          const removeTsFiles = (dir: string) => {
            const entries = readdirSync(dir, { withFileTypes: true });
            for (const entry of entries) {
              const fullPath = join(dir, entry.name);

              if (entry.isDirectory()) {
                removeTsFiles(fullPath);
              } else if (
                entry.isFile() &&
                (entry.name.endsWith('.ts') || entry.name.endsWith('.tsx'))
              ) {
                rmSync(fullPath, { force: true });
              }
            }
          };

          removeTsFiles(adminPath);
        }
      } finally {
        // Clean up temporary tsconfig
        rmSync(adminTsConfig, { force: true });
      }
    }

    // Compile API module (CommonJS)
    if (plugin.hasApi && existsSync(join(plugin.path, 'api'))) {
      const apiPath = join(plugin.path, 'api');
      const apiTsConfig = join(apiPath, 'tsconfig.json');

      // Create temporary tsconfig for API compilation
      const apiTsConfigContent = {
        compilerOptions: {
          target: 'ES2020',
          lib: ['ES2020'],
          allowJs: true,
          skipLibCheck: true,
          esModuleInterop: true,
          allowSyntheticDefaultImports: true,
          strict: skipTypeCheck ? false : true,
          forceConsistentCasingInFileNames: true,
          noFallthroughCasesInSwitch: true,
          module: 'CommonJS',
          moduleResolution: 'node',
          resolveJsonModule: true,
          isolatedModules: true,
          noEmit: false,
          outDir: './dist',
          noEmitOnError: skipTypeCheck ? false : true,
        },
        include: ['**/*.ts'],
        exclude: ['node_modules', 'dist'],
      };

      // Write temporary tsconfig
      writeFileSync(apiTsConfig, JSON.stringify(apiTsConfigContent, null, 2));

      try {
        // Compile API TypeScript files
        console.log('Compiling API module: npx tsc');

        try {
          execFileSync('npx', ['tsc'], { cwd: apiPath, stdio: 'inherit' });
        } catch (compileError) {
          if (skipTypeCheck) {
            console.warn(
              'TypeScript compilation failed, but continuing due to skip type check option',
            );
            // Create dist directory manually if compilation failed
            const distPath = join(apiPath, 'dist');
            if (!existsSync(distPath)) {
              mkdirSync(distPath, { recursive: true });
            }
            // Copy TypeScript files as JavaScript (fallback)
            const tsFiles = await fg(['**/*.ts'], {
              cwd: apiPath,
              ignore: ['node_modules/**', 'dist/**'],
            });
            for (const file of tsFiles) {
              const srcPath = join(apiPath, file);
              const destFile = file.replace(/\.ts$/, '.js');
              const destPath = join(distPath, destFile);
              const destDir = join(destPath, '..');
              if (!existsSync(destDir)) {
                mkdirSync(destDir, { recursive: true });
              }
              copyFileSync(srcPath, destPath);
            }
          } else {
            throw compileError;
          }
        }

        // Copy non-TS files to dist
        const distPath = join(apiPath, 'dist');
        if (existsSync(distPath)) {
          // Copy non-TS files to dist using fast-glob
          const assetFiles = await fg(['**/*.json', '**/*.graphql'], {
            cwd: apiPath,
            ignore: ['node_modules/**', 'dist/**'],
          });
          for (const file of assetFiles) {
            const srcPath = join(apiPath, file);
            const destPath = join(distPath, file);
            const destDir = join(destPath, '..');
            if (!existsSync(destDir)) {
              mkdirSync(destDir, { recursive: true });
            }
            copyFileSync(srcPath, destPath);
          }

          // Move compiled files back to original structure (no dist folder)
          const moveFiles = (srcDir: string, destDir: string) => {
            const entries = readdirSync(srcDir, { withFileTypes: true });
            for (const entry of entries) {
              const srcPath = join(srcDir, entry.name);
              const destPath = join(destDir, entry.name);

              if (entry.isDirectory()) {
                if (!existsSync(destPath)) {
                  mkdirSync(destPath, { recursive: true });
                }
                moveFiles(srcPath, destPath);
              } else {
                copyFileSync(srcPath, destPath);
              }
            }
          };

          // Move all files from dist back to api directory
          moveFiles(distPath, apiPath);

          // Remove the dist directory
          rmSync(distPath, { recursive: true, force: true });

          // Remove original TypeScript files
          const removeTsFiles = (dir: string) => {
            const entries = readdirSync(dir, { withFileTypes: true });
            for (const entry of entries) {
              const fullPath = join(dir, entry.name);

              if (entry.isDirectory()) {
                removeTsFiles(fullPath);
              } else if (entry.isFile() && entry.name.endsWith('.ts')) {
                rmSync(fullPath, { force: true });
              }
            }
          };

          removeTsFiles(apiPath);
        }
      } finally {
        // Clean up temporary tsconfig
        rmSync(apiTsConfig, { force: true });
      }
    }

    console.log(
      `TypeScript compilation completed successfully${skipTypeCheck ? ' (type checking skipped)' : ''}`,
    );
  } catch (error) {
    // Restore original files on error
    console.error('Compilation failed, restoring original files...');
    rmSync(plugin.path, { recursive: true, force: true });
    cpSync(backupPath, plugin.path, { recursive: true });
    rmSync(backupPath, { recursive: true, force: true });
    throw error;
  }
  // No need for explicit return - async function returns Promise<void> implicitly
}

export async function createProductionZip(
  plugin: PluginInfo,
  opts: ZipRoot = {},
): Promise<string> {
  const root = opts.root ?? plugin.path;

  // If your compiled output lives *inside* `root/dist`, set `root` to that dist:
  // const root = opts.root ?? join(plugin.path, 'dist');

  const zipOutputDir = join(process.cwd(), 'plugin-zips');
  if (!existsSync(zipOutputDir)) mkdirSync(zipOutputDir, { recursive: true });

  // Use plugin.name as fallback if manifest-based ID isn’t available here
  const buildType = 'prod';
  const zipFileName = `${plugin.name || 'plugin'}-${buildType}.zip`;
  const zipPath = join(zipOutputDir, zipFileName);

  // Determine the exact subtrees/files to include
  const files: Array<{
    fsPath: string;
    zipPath: string;
    stats: ReturnType<typeof statSync>;
  }> = [];

  // If your layout keeps admin/api at top-level after compile:
  if (plugin.hasAdmin && existsSync(join(root, 'admin'))) {
    files.push(...listFilesRecursive(join(root, 'admin'), 'admin'));
  }
  if (plugin.hasApi && existsSync(join(root, 'api'))) {
    files.push(...listFilesRecursive(join(root, 'api'), 'api'));
  }

  // Include top-level runtime files (manifest/package are important)
  for (const base of [
    'manifest.json',
    'package.json',
    'README.md',
    'LICENSE',
  ]) {
    const p = join(root, base);
    if (existsSync(p)) {
      const st = statSync(p);
      if (st.isFile()) {
        files.push({ fsPath: p, zipPath: base, stats: st });
      }
    }
  }

  // If neither admin/api, include everything under root (compiled-only)
  if (files.length === 0) {
    files.push(...listFilesRecursive(root, ''));
  }

  // Create the archive safely (no append(), no ZIP64)
  const out = createWriteStream(zipPath);
  const archive = archiver('zip', {
    zlib: { level: 9 },
    store: false,
    forceZip64: false,
  });

  const done = new Promise<void>((resolve, reject) => {
    out.on('close', () => resolve());
    out.on('error', reject);
    archive.on('warning', (err: ArchiveWarning) => {
      if (err?.code === 'ENOENT') {
        console.warn(
          '[Archive] Skipping missing file:',
          err.message || 'Unknown file',
        );
      } else {
        reject(err);
      }
    });
    archive.on('error', reject);
  });

  archive.pipe(out);

  for (const f of files) {
    if (!f.stats) continue; // Skip files without stats
    const mtimeMs = Number(f.stats.mtimeMs);
    const mtime = new Date(Math.floor(mtimeMs / 1000) * 1000);
    archive.file(f.fsPath, {
      name: f.zipPath.replace(/\\/g, '/'),
      // Use Partial<Stats> to allow mtime override while satisfying archiver's type requirements
      stats: { ...f.stats, mtime } as Partial<Stats> as Stats | undefined,
      // keep compression on to avoid "uncompressed content" issues
    });
  }

  archive.finalize();
  await done;

  console.log(`\nProduction ZIP created: ${zipFileName}`);
  console.log(`Location: ${zipPath}`);
  console.log(
    `Approx size: ${(statSync(zipPath).size / 1024 / 1024).toFixed(2)} MB`,
  );
  console.log('Flags: no append(), ZIP64 disabled, filtered to runtime files');

  return zipPath;
}
