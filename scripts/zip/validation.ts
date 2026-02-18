import { spinner } from '@clack/prompts';
import { existsSync, readdirSync } from 'node:fs';
import { execFileSync } from 'node:child_process';
import { join } from 'node:path';

export class PluginTestError extends Error {
  constructor(message: string) {
    super(message);
    this.name = 'PluginTestError';
  }
}

/**
 * Runs platform and plugin-specific validation tests before packaging
 * @param pluginName - Name of the plugin to validate (must match [A-Za-z0-9_-]+)
 * @param skipTests - If true, allows packaging without plugin tests (with deprecation warning)
 * @throws {Error} If plugin name is invalid, platform tests fail, or required plugin tests fail
 */
export async function runValidationTests(
  pluginName: string,
  skipTests = false,
): Promise<void> {
  const s = spinner();

  try {
    // Validate pluginName to prevent command injection
    if (!/^[A-Za-z0-9_-]+$/.test(pluginName)) {
      s.stop('Invalid plugin name');
      throw new Error(
        `Invalid plugin name "${pluginName}". Plugin names must only contain letters, numbers, hyphens, and underscores.`,
      );
    }

    // Run platform validation tests
    s.start('Running platform validation tests...');
    execFileSync(
      'pnpm',
      ['exec', 'vitest', 'run', 'test/platform/', '--reporter=verbose'],
      { stdio: 'inherit' },
    );
    s.stop('Platform validation tests passed');

    // Check if plugin-specific tests exist
    const pluginTestPath = join('test', 'plugins', pluginName);

    // Check if directory exists AND contains test files
    let hasTestFiles = false;
    if (existsSync(pluginTestPath)) {
      const files = readdirSync(pluginTestPath, { recursive: true });
      hasTestFiles = files.some(
        (file: string | Buffer) =>
          typeof file === 'string' &&
          (file.endsWith('.test.ts') ||
            file.endsWith('.test.tsx') ||
            file.endsWith('.spec.ts') ||
            file.endsWith('.spec.tsx')),
      );
    }

    if (hasTestFiles) {
      s.start(`Running ${pluginName} plugin tests...`);
      try {
        execFileSync(
          'pnpm',
          [
            'exec',
            'vitest',
            'run',
            `test/plugins/${pluginName}/`,
            '--reporter=verbose',
          ],
          { stdio: 'inherit' },
        );
        s.stop(`${pluginName} plugin tests passed`);
      } catch (error) {
        s.stop(`${pluginName} plugin tests failed`);
        throw new PluginTestError(
          `Plugin-specific tests failed for "${pluginName}". ${error instanceof Error ? error.message : 'Unknown error'}`,
        );
      }
    } else if (skipTests) {
      // Graceful fallback for legacy plugins
      s.stop('No test files found');
      console.warn(
        `\n[DEPRECATION WARNING] Plugin "${pluginName}" has no test files.`,
      );
      console.warn(
        `Packaging is allowed due to --skip-tests flag or SKIP_TESTS env var.`,
      );
      console.warn(
        `Please add tests before the next release. Support for untested plugins will be removed in future versions.\n`,
      );
      return;
    } else {
      s.stop('No test files found');
      throw new Error(
        `No test files found for ${pluginName} plugin at ${pluginTestPath}.\nPlease add tests before packaging this plugin.\nTo package anyway (not recommended), use --skip-tests flag or set SKIP_TESTS=true env var.`,
      );
    }
  } catch (error) {
    s.stop('Validation failed');

    if (error instanceof PluginTestError) {
      throw error;
    }

    // Re-throw with more context if this is a platform test failure
    if (error instanceof Error) {
      throw new Error(`Platform validation tests failed. ${error.message}`);
    }
    throw new Error(
      'Validation failed with unknown error. Please check test output above.',
    );
  }
}
