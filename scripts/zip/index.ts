// scripts/zip/index.ts
import {
  intro,
  outro,
  isCancel,
  select,
  confirm,
  spinner,
} from '@clack/prompts';
import chalk from 'chalk';

import { readdirSync, existsSync, rmSync, cpSync } from 'node:fs';
import { join } from 'node:path';
import { createZip } from './createZip.js';
import { compileForProduction } from './compileProduction.js';
import { runValidationTests } from './validation.js';

const PLUGINS_DIR = 'plugins';

interface PluginInfo {
  name: string;
  path: string;
  hasAdmin: boolean;
  hasApi: boolean;
}

async function getAvailablePlugins(): Promise<PluginInfo[]> {
  const plugins: PluginInfo[] = [];

  if (!existsSync(PLUGINS_DIR)) {
    return plugins;
  }

  const pluginDirs = readdirSync(PLUGINS_DIR, { withFileTypes: true })
    .filter((dirent) => dirent.isDirectory())
    .map((dirent) => dirent.name);

  for (const pluginName of pluginDirs) {
    const pluginPath = join(PLUGINS_DIR, pluginName);
    const adminPath = join(pluginPath, 'admin');
    const apiPath = join(pluginPath, 'api');

    plugins.push({
      name: pluginName,
      path: pluginPath,
      hasAdmin: existsSync(adminPath),
      hasApi: existsSync(apiPath),
    });
  }

  return plugins;
}

/**
 * Restores plugin files from backup after production build
 * @param pluginPath - Absolute path to the plugin directory
 */
function restoreBackup(pluginPath: string): void {
  const backupPath = `${pluginPath}.backup`;

  if (existsSync(backupPath)) {
    rmSync(pluginPath, { recursive: true, force: true });
    cpSync(backupPath, pluginPath, { recursive: true });
    rmSync(backupPath, { recursive: true, force: true });
  }
}

async function main() {
  intro(chalk.bold('Talawa Plugin Zipper'));

  // Check for skip tests flag from CLI args or env var
  const skipTests =
    process.argv.includes('--skip-tests') || process.env.SKIP_TESTS === 'true';

  if (skipTests) {
    console.warn(
      '\n[WARNING] Test validation will be skipped for plugins without tests.',
    );
    console.warn('This is not recommended for production use.\n');
  }

  try {
    // Get available plugins
    const s = spinner();
    s.start('Scanning for available plugins...');

    const availablePlugins = await getAvailablePlugins();

    if (availablePlugins.length === 0) {
      s.stop('No plugins found');
      outro('No plugins found in the plugins directory.');
      return;
    }

    s.stop(`Found ${availablePlugins.length} plugin(s)`);

    // Let user select a plugin
    const pluginOptions = availablePlugins.map((plugin) => ({
      value: plugin.name,
      label:
        `${plugin.name} ${plugin.hasAdmin ? '(Admin)' : ''} ${plugin.hasApi ? '(API)' : ''}`.trim(),
    }));

    const selectedPluginName = await select({
      message: 'Select a plugin to zip:',
      options: pluginOptions,
    });

    if (isCancel(selectedPluginName)) {
      outro('Operation cancelled');
      return;
    }

    const selectedPlugin = availablePlugins.find(
      (p) => p.name === selectedPluginName,
    );
    if (!selectedPlugin) {
      outro('Selected plugin not found');
      return;
    }

    // Ask if it's for development or production
    const isDevelopment = await confirm({
      message: 'Is this for development? (Yes = development, No = production)',
      initialValue: true,
    });

    if (isCancel(isDevelopment)) {
      outro('Operation cancelled');
      return;
    }

    // For production builds, ask about type checking
    let skipTypeCheck = false;
    if (!isDevelopment) {
      const typeCheckResponse = await confirm({
        message:
          'Skip type checking for production build? (Yes = skip, No = run type check)',
        initialValue: false,
      });

      if (isCancel(typeCheckResponse)) {
        outro('Operation cancelled');
        return;
      }

      skipTypeCheck = typeCheckResponse;
    }

    // Run validation tests before creating zip
    await runValidationTests(selectedPluginName as string, skipTests);

    // Create zip
    const zipSpinner = spinner();
    zipSpinner.start(
      `Creating ${isDevelopment ? 'development' : 'production'} zip for ${selectedPluginName}...`,
    );

    try {
      if (isDevelopment) {
        // For development: zip TypeScript files directly
        await createZip(selectedPlugin, true);
      } else {
        // For production: compile TypeScript to JavaScript first, then zip
        await compileForProduction(selectedPlugin, skipTypeCheck);
        await createZip(selectedPlugin, false);

        // Restore original TypeScript files
        restoreBackup(selectedPlugin.path);
      }

      zipSpinner.stop(`${selectedPluginName} zipped successfully!`);
      outro(
        chalk.green(
          `Plugin "${selectedPluginName}" has been zipped as ${isDevelopment ? 'development' : 'production'} build.`,
        ),
      );
    } catch (error) {
      zipSpinner.stop('Failed to create zip');
      console.error('Error creating zip:', error);

      // Restore original files on error for production builds
      if (!isDevelopment) {
        restoreBackup(selectedPlugin.path);
      }

      outro('Failed to create plugin zip');
    }
  } catch (err: unknown) {
    console.error('Error:', err);
    outro('Operation failed. See error above for details.');
    process.exitCode = 1;
  }
}

main();
