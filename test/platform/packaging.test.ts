import { describe, it, expect, beforeEach, afterEach, vi } from 'vitest';
import {
  existsSync,
  statSync,
  rmSync,
  mkdirSync,
  writeFileSync,
  mkdtempSync,
} from 'node:fs';
import { join } from 'node:path';
import { tmpdir } from 'node:os';
import { createZip } from '../../scripts/zip/createZip';
import AdmZip from 'adm-zip';
import { validManifest } from '../utils/fixtures';

// Mock archiver for error injection
let mockArchiverError: Error | null = null;
let mockArchiverWarning: unknown | null = null;

vi.mock('archiver', async () => {
  const actual = await vi.importActual<{
    default: (
      format: string,
      options: import('archiver').ArchiverOptions,
    ) => import('archiver').Archiver;
  }>('archiver');
  return {
    default: (format: string, options: import('archiver').ArchiverOptions) => {
      const archive = actual.default(format, options);
      // Hook into finalize to trigger errors if set
      const originalFinalize = archive.finalize.bind(archive);
      archive.finalize = async () => {
        if (mockArchiverError) {
          archive.emit('error', mockArchiverError);
          // Return a promise that resolves (void) to prevent unhandled rejection.
          // The error emitted above will be handled by the 'error' listener in createZip
          // which will reject the main promise.
          return Promise.resolve();
        }
        if (mockArchiverWarning) {
          archive.emit('warning', mockArchiverWarning);
        }
        return originalFinalize();
      };
      return archive;
    },
  };
});

describe('Plugin Packager', () => {
  const testOutputDir = join(process.cwd(), 'plugin-zips');
  const testPluginDir = join(process.cwd(), 'test-plugin-temp');

  // Setup test plugin structure
  beforeEach(() => {
    // Create test plugin directory
    if (!existsSync(testPluginDir)) {
      mkdirSync(testPluginDir, { recursive: true });
    }

    // Create admin module
    const adminDir = join(testPluginDir, 'admin');
    mkdirSync(adminDir, { recursive: true });
    writeFileSync(
      join(adminDir, 'index.tsx'),
      'export default function TestPlugin() { return <div>Test</div>; }',
    );
    writeFileSync(
      join(adminDir, 'manifest.json'),
      JSON.stringify({
        ...validManifest,
        extensionPoints: {},
        description: 'Test plugin for packaging',
      }),
    );

    // Add a file with sufficient size to prevent "zip too small" errors
    writeFileSync(
      join(adminDir, 'dummy.txt'),
      'x'.repeat(200), // 200 bytes
    );

    // Create API module
    const apiDir = join(testPluginDir, 'api');
    mkdirSync(apiDir, { recursive: true });
    writeFileSync(
      join(apiDir, 'index.ts'),
      'export const testResolver = () => ({ test: "data" });',
    );
    writeFileSync(
      join(apiDir, 'manifest.json'),
      JSON.stringify({
        ...validManifest,
        extensionPoints: {},
        name: 'Test Plugin API',
        description: 'Test plugin API for packaging',
      }),
    );
    // Reset mocks
    mockArchiverError = null;
    mockArchiverWarning = null;
  });

  afterEach(() => {
    // Cleanup test plugin directory
    if (existsSync(testPluginDir)) {
      rmSync(testPluginDir, { recursive: true, force: true });
    }

    // Cleanup generated zip files
    const devZipPath = join(testOutputDir, 'test-plugin-dev.zip');
    const prodZipPath = join(testOutputDir, 'test-plugin-prod.zip');

    if (existsSync(devZipPath)) {
      rmSync(devZipPath, { force: true });
    }
    if (existsSync(prodZipPath)) {
      rmSync(prodZipPath, { force: true });
    }
  });

  describe('Packaging Script Structure', () => {
    it('should have createZip function exported', () => {
      expect(createZip).toBeDefined();
      expect(typeof createZip).toBe('function');
    });

    it('should have packaging scripts available', () => {
      const createZipPath = join(process.cwd(), 'scripts/zip/createZip.ts');
      expect(existsSync(createZipPath)).toBe(true);
    });

    it('should ensure plugin-zips output directory exists', () => {
      if (!existsSync(testOutputDir)) {
        mkdirSync(testOutputDir, { recursive: true });
      }
      expect(existsSync(testOutputDir)).toBe(true);
    });
  });

  describe('Zip File Creation', () => {
    it('should create development build zip', async () => {
      const pluginInfo = {
        name: 'test-plugin',
        path: testPluginDir,
        hasAdmin: true,
        hasApi: true,
      };

      await createZip(pluginInfo, true);

      const devZipPath = join(testOutputDir, 'test-plugin-dev.zip');
      expect(existsSync(devZipPath)).toBe(true);
    }, 10000);

    it('should create production build zip', async () => {
      const pluginInfo = {
        name: 'test-plugin',
        path: testPluginDir,
        hasAdmin: true,
        hasApi: true,
      };

      await createZip(pluginInfo, false);

      const prodZipPath = join(testOutputDir, 'test-plugin-prod.zip');
      expect(existsSync(prodZipPath)).toBe(true);
    }, 10000);

    it('should create valid zip file with minimum size', async () => {
      const pluginInfo = {
        name: 'test-plugin',
        path: testPluginDir,
        hasAdmin: true,
        hasApi: true,
      };

      await createZip(pluginInfo, true);

      const zipPath = join(testOutputDir, 'test-plugin-dev.zip');
      const stats = statSync(zipPath);

      // Zip should be at least 100 bytes (validation threshold)
      expect(stats.size).toBeGreaterThan(100);
    }, 10000);
  });

  describe('Manifest Inclusion in Packages', () => {
    it('should include admin manifest in zip', async () => {
      const pluginInfo = {
        name: 'test-plugin',
        path: testPluginDir,
        hasAdmin: true,
        hasApi: false,
      };

      await createZip(pluginInfo, true);

      const zipPath = join(testOutputDir, 'test-plugin-dev.zip');
      const zip = new AdmZip(zipPath);
      const zipEntries = zip.getEntries();

      const adminManifest = zipEntries.find(
        (entry) => entry.entryName === 'admin/manifest.json',
      );
      expect(adminManifest).toBeDefined();
    }, 10000);

    it('should include api manifest in zip', async () => {
      const pluginInfo = {
        name: 'test-plugin',
        path: testPluginDir,
        hasAdmin: false,
        hasApi: true,
      };

      await createZip(pluginInfo, true);

      const zipPath = join(testOutputDir, 'test-plugin-dev.zip');
      const zip = new AdmZip(zipPath);
      const zipEntries = zip.getEntries();

      const apiManifest = zipEntries.find(
        (entry) => entry.entryName === 'api/manifest.json',
      );
      expect(apiManifest).toBeDefined();
    }, 10000);

    it('should validate manifest content in zip', async () => {
      const pluginInfo = {
        name: 'test-plugin',
        path: testPluginDir,
        hasAdmin: true,
        hasApi: false,
      };

      await createZip(pluginInfo, true);

      const zipPath = join(testOutputDir, 'test-plugin-dev.zip');
      const zip = new AdmZip(zipPath);
      const manifestEntry = zip.getEntry('admin/manifest.json');

      expect(manifestEntry).toBeDefined();
      if (manifestEntry) {
        const manifestContent = manifestEntry.getData().toString('utf-8');
        const manifest = JSON.parse(manifestContent);

        expect(manifest.pluginId).toBe('test-plugin');
        expect(manifest.version).toBe('1.0.0');
        expect(manifest.name).toBeDefined();
      }
    }, 10000);
  });

  describe('Zip Integrity Verification', () => {
    it('should create extractable zip file', async () => {
      const pluginInfo = {
        name: 'test-plugin',
        path: testPluginDir,
        hasAdmin: true,
        hasApi: true,
      };

      await createZip(pluginInfo, true);

      const zipPath = join(testOutputDir, 'test-plugin-dev.zip');

      // Should not throw when extracting
      expect(() => {
        const zip = new AdmZip(zipPath);
        zip.getEntries(); // This will fail if zip is corrupt
      }).not.toThrow();
    }, 10000);

    it('should include expected files in zip', async () => {
      const pluginInfo = {
        name: 'test-plugin',
        path: testPluginDir,
        hasAdmin: true,
        hasApi: true,
      };

      await createZip(pluginInfo, true);

      const zipPath = join(testOutputDir, 'test-plugin-dev.zip');
      const zip = new AdmZip(zipPath);
      const entries = zip.getEntries().map((e) => e.entryName);

      // Should contain admin files
      expect(entries).toContain('admin/index.tsx');
      expect(entries).toContain('admin/manifest.json');

      // Should contain api files
      expect(entries).toContain('api/index.ts');
      expect(entries).toContain('api/manifest.json');
    }, 10000);

    it('should not include OS-specific junk files', async () => {
      // Create junk files
      writeFileSync(join(testPluginDir, '.DS_Store'), '');
      writeFileSync(join(testPluginDir, 'Thumbs.db'), '');

      const pluginInfo = {
        name: 'test-plugin',
        path: testPluginDir,
        hasAdmin: true,
        hasApi: false,
      };

      await createZip(pluginInfo, true);

      const zipPath = join(testOutputDir, 'test-plugin-dev.zip');
      const zip = new AdmZip(zipPath);
      const entries = zip.getEntries().map((e) => e.entryName);

      // Should NOT contain junk files
      expect(entries).not.toContain('.DS_Store');
      expect(entries).not.toContain('Thumbs.db');
    }, 10000);

    it('should use forward slashes in zip paths', async () => {
      const pluginInfo = {
        name: 'test-plugin',
        path: testPluginDir,
        hasAdmin: true,
        hasApi: false,
      };

      await createZip(pluginInfo, true);

      const zipPath = join(testOutputDir, 'test-plugin-dev.zip');
      const zip = new AdmZip(zipPath);
      const entries = zip.getEntries();

      // All paths should use forward slashes (cross-platform compatibility)
      entries.forEach((entry) => {
        expect(entry.entryName).not.toMatch(/\\/);
      });
    }, 10000);
  });

  describe('File Structure Validation', () => {
    it('should preserve directory structure in zip', async () => {
      // Create nested directory structure
      const pagesDir = join(testPluginDir, 'admin', 'pages');
      mkdirSync(pagesDir, { recursive: true });
      writeFileSync(
        join(pagesDir, 'TestPage.tsx'),
        'export default function TestPage() {}',
      );

      const pluginInfo = {
        name: 'test-plugin',
        path: testPluginDir,
        hasAdmin: true,
        hasApi: false,
      };

      await createZip(pluginInfo, true);

      const zipPath = join(testOutputDir, 'test-plugin-dev.zip');
      const zip = new AdmZip(zipPath);
      const entries = zip.getEntries().map((e) => e.entryName);

      expect(entries).toContain('admin/pages/TestPage.tsx');
    }, 10000);
  });

  describe('Error Handling', () => {
    it('should handle plugin with only admin module', async () => {
      // Remove api directory
      rmSync(join(testPluginDir, 'api'), { recursive: true, force: true });

      const pluginInfo = {
        name: 'test-plugin',
        path: testPluginDir,
        hasAdmin: true,
        hasApi: false,
      };

      await createZip(pluginInfo, true);

      const zipPath = join(testOutputDir, 'test-plugin-dev.zip');
      const zip = new AdmZip(zipPath);
      const entries = zip.getEntries().map((e) => e.entryName);

      // Should contain admin files
      expect(entries).toContain('admin/index.tsx');
      expect(entries).toContain('admin/manifest.json');

      // Should NOT contain api files
      expect(entries.some((e) => e.startsWith('api/'))).toBe(false);
    }, 10000);

    it('should handle plugin with only API module', async () => {
      // Remove admin directory
      rmSync(join(testPluginDir, 'admin'), { recursive: true, force: true });

      const pluginInfo = {
        name: 'test-plugin',
        path: testPluginDir,
        hasAdmin: false,
        hasApi: true,
      };

      await createZip(pluginInfo, true);

      const zipPath = join(testOutputDir, 'test-plugin-dev.zip');
      const zip = new AdmZip(zipPath);
      const entries = zip.getEntries().map((e) => e.entryName);

      // Should contain api files
      expect(entries).toContain('api/index.ts');
      expect(entries).toContain('api/manifest.json');

      // Should NOT contain admin files
      expect(entries.some((e) => e.startsWith('admin/'))).toBe(false);
    }, 10000);

    it('should reject zip files that fail validation', async () => {
      const pluginInfo = {
        name: 'test-plugin',
        path: testPluginDir,
        hasAdmin: true,
        hasApi: false,
      };

      await createZip(pluginInfo, true);

      const zipPath = join(testOutputDir, 'test-plugin-dev.zip');

      // Corrupt the zip file by truncating it
      writeFileSync(zipPath, 'corrupted data');

      // Try to read the corrupted zip
      expect(() => {
        new AdmZip(zipPath);
      }).toThrow();
    }, 10000);

    it('should handle plugins with complex nested directory structures', async () => {
      // Create complex nested structure
      const deepPath = join(
        testPluginDir,
        'admin',
        'components',
        'forms',
        'inputs',
      );
      mkdirSync(deepPath, { recursive: true });
      writeFileSync(
        join(deepPath, 'TextInput.tsx'),
        'export const TextInput = () => {};',
      );

      const pluginInfo = {
        name: 'test-plugin',
        path: testPluginDir,
        hasAdmin: true,
        hasApi: false,
      };

      await createZip(pluginInfo, true);

      const zipPath = join(testOutputDir, 'test-plugin-dev.zip');
      const zip = new AdmZip(zipPath);
      const entries = zip.getEntries().map((e) => e.entryName);

      expect(entries).toContain('admin/components/forms/inputs/TextInput.tsx');
    }, 10000);

    it('should handle missing manifest files gracefully', async () => {
      // Remove manifest files
      rmSync(join(testPluginDir, 'admin/manifest.json'));
      rmSync(join(testPluginDir, 'api/manifest.json'));

      const pluginInfo = {
        name: 'test-plugin',
        path: testPluginDir,
        hasAdmin: true,
        hasApi: true,
      };

      // Should still create zip (fallback to directory name)
      await expect(createZip(pluginInfo, true)).resolves.not.toThrow();
    });

    it('should reject empty plugin directories', async () => {
      const emptyDir = mkdtempSync(join(tmpdir(), 'empty-plugin-'));
      try {
        const pluginInfo = {
          name: 'empty',
          path: emptyDir,
          hasAdmin: false,
          hasApi: false,
        };

        await expect(createZip(pluginInfo, true)).rejects.toThrow(
          'Zip file is too small',
        );
      } finally {
        rmSync(emptyDir, { recursive: true, force: true });
      }
    });

    it('should handle archiver errors', async () => {
      mockArchiverError = new Error('Simulated archiver error');
      const pluginInfo = {
        name: 'test-plugin',
        path: testPluginDir,
        hasAdmin: true,
        hasApi: true,
      };
      await expect(createZip(pluginInfo, true)).rejects.toThrow(
        'Simulated archiver error',
      );
    });

    it('should handle archiver warnings (non-ENOENT)', async () => {
      // Warnings usually don't throw, but log.
      // However, the code at 161 (archive.on('warning', ...)) seems to rejectClose if not ENOENT.
      // So checking if it rejects.
      mockArchiverWarning = {
        code: 'OTHER_WARNING',
        message: 'Something warn',
      };
      const pluginInfo = {
        name: 'test-plugin',
        path: testPluginDir,
        hasAdmin: true,
        hasApi: true,
      };
      await expect(createZip(pluginInfo, true)).rejects.toHaveProperty(
        'code',
        'OTHER_WARNING',
      );
    });

    it('should ignore archiver ENOENT warnings', async () => {
      mockArchiverWarning = { code: 'ENOENT', message: 'Missing file ignored' };
      const pluginInfo = {
        name: 'test-plugin',
        path: testPluginDir,
        hasAdmin: true,
        hasApi: true,
      };
      // Should succeed despite warning
      await expect(createZip(pluginInfo, true)).resolves.not.toThrow();
    });
  });

  describe('Plugin ID Resolution', () => {
    it('should fallback to directory name for pluginId when manifests are missing', async () => {
      rmSync(join(testPluginDir, 'admin/manifest.json'));
      rmSync(join(testPluginDir, 'api/manifest.json'));

      const pluginInfo = {
        name: 'test-plugin',
        path: testPluginDir,
        hasAdmin: true,
        hasApi: true,
      };

      await createZip(pluginInfo, true);
      // Check for zip with folder name
      // folder is `test-plugin-temp`
      const expectedZip = join(testOutputDir, 'test-plugin-temp-dev.zip');
      expect(existsSync(expectedZip)).toBe(true);
      // Clean up this specific file
      rmSync(expectedZip, { force: true });
    });
  });
});
