import { describe, it, expect, vi, afterEach, beforeEach } from 'vitest';
import {
  existsSync,
  mkdtempSync,
  rmSync,
  readFileSync,
  mkdirSync,
} from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';
import { createAdminSkeleton } from '../../scripts/init/initAdmin';
import { createAPISkeleton } from '../../scripts/init/initApi';

vi.mock('node:fs', async (importOriginal) => {
  const actual = await importOriginal<typeof import('node:fs')>();
  return {
    ...actual,
    mkdirSync: vi.fn(actual.mkdirSync),
  };
});

describe('Plugin Generator', () => {
  describe('Admin Module Generation', () => {
    it('should create admin module structure', () => {
      const tempDir = mkdtempSync(join(tmpdir(), 'plugin-test-'));

      try {
        createAdminSkeleton('TestPlugin', tempDir);

        // Check if admin directory exists
        expect(existsSync(join(tempDir, 'TestPlugin/admin'))).toBe(true);

        // Check if essential files exist
        expect(existsSync(join(tempDir, 'TestPlugin/admin/index.tsx'))).toBe(
          true,
        );
        expect(
          existsSync(join(tempDir, 'TestPlugin/admin/manifest.json')),
        ).toBe(true);
        expect(existsSync(join(tempDir, 'TestPlugin/admin/info.json'))).toBe(
          true,
        );
        expect(existsSync(join(tempDir, 'TestPlugin/admin/README.md'))).toBe(
          true,
        );

        // Check if directories and nested files exist
        expect(existsSync(join(tempDir, 'TestPlugin/admin/pages'))).toBe(true);
        expect(
          existsSync(join(tempDir, 'TestPlugin/admin/pages/index.tsx')),
        ).toBe(true);
        expect(existsSync(join(tempDir, 'TestPlugin/admin/assets'))).toBe(true);
        expect(
          existsSync(join(tempDir, 'TestPlugin/admin/assets/placeholder.txt')),
        ).toBe(true);
        expect(existsSync(join(tempDir, 'TestPlugin/admin/injector'))).toBe(
          true,
        );
        expect(
          existsSync(
            join(tempDir, 'TestPlugin/admin/injector/IconInjector.tsx'),
          ),
        ).toBe(true);
      } finally {
        // Cleanup
        if (existsSync(tempDir)) {
          rmSync(tempDir, { recursive: true, force: true });
        }
      }
    });
  });

  describe('API Module Generation', () => {
    it('should create api module structure', () => {
      const tempDir = mkdtempSync(join(tmpdir(), 'plugin-test-'));

      try {
        createAPISkeleton('TestPlugin', tempDir);

        // Check if api directory exists
        expect(existsSync(join(tempDir, 'TestPlugin/api'))).toBe(true);

        // Check if essential files exist
        expect(existsSync(join(tempDir, 'TestPlugin/api/index.ts'))).toBe(true);
        expect(existsSync(join(tempDir, 'TestPlugin/api/manifest.json'))).toBe(
          true,
        );
        expect(existsSync(join(tempDir, 'TestPlugin/api/README.md'))).toBe(
          true,
        );

        // Check if nested directories and files exist
        expect(existsSync(join(tempDir, 'TestPlugin/api/graphql'))).toBe(true);
        expect(
          existsSync(join(tempDir, 'TestPlugin/api/graphql/inputs.ts')),
        ).toBe(true);
        expect(
          existsSync(join(tempDir, 'TestPlugin/api/graphql/queries.ts')),
        ).toBe(true);
        expect(
          existsSync(join(tempDir, 'TestPlugin/api/graphql/mutations.ts')),
        ).toBe(true);
        expect(
          existsSync(join(tempDir, 'TestPlugin/api/graphql/types.ts')),
        ).toBe(true);
        expect(existsSync(join(tempDir, 'TestPlugin/api/database'))).toBe(true);
        expect(
          existsSync(join(tempDir, 'TestPlugin/api/database/tables.ts')),
        ).toBe(true);
      } finally {
        // Cleanup
        if (existsSync(tempDir)) {
          rmSync(tempDir, { recursive: true, force: true });
        }
      }
    });
  });

  describe('Content Validation', () => {
    it('should validate generated admin manifest content', () => {
      const tempDir = mkdtempSync(join(tmpdir(), 'plugin-test-'));

      try {
        createAdminSkeleton('TestPlugin', tempDir);

        const manifestPath = join(tempDir, 'TestPlugin/admin/manifest.json');
        const manifest = JSON.parse(readFileSync(manifestPath, 'utf-8'));

        // Verify name transformations
        expect(manifest.name).toBe('TestPlugin');
        expect(manifest.pluginId).toBe('testplugin'); // Should be lowercase
        expect(manifest.version).toBe('1.0.0');
        expect(manifest.description).toBeDefined();
        expect(manifest.author).toBeDefined();

        // Verify extension points
        expect(manifest.extensionPoints).toBeDefined();
        expect(manifest.extensionPoints.RA1).toBeDefined();
        expect(manifest.extensionPoints.DA1).toBeDefined();
        expect(manifest.extensionPoints.G1).toBeDefined();
        expect(manifest.extensionPoints.RA1[0].path).toContain('testplugin');
      } finally {
        rmSync(tempDir, { recursive: true, force: true });
      }
    });

    it('should validate generated API manifest content', () => {
      const tempDir = mkdtempSync(join(tmpdir(), 'plugin-test-'));

      try {
        createAPISkeleton('TestPlugin', tempDir);

        const manifestPath = join(tempDir, 'TestPlugin/api/manifest.json');
        const manifest = JSON.parse(readFileSync(manifestPath, 'utf-8'));

        // Verify name transformations
        expect(manifest.name).toBe('TestPlugin');
        expect(manifest.pluginId).toBe('testplugin');
        expect(manifest.version).toBe('1.0.0');
        expect(manifest.description).toBeDefined();
        expect(manifest.author).toBeDefined();

        // Verify extension points
        expect(manifest.extensionPoints).toBeDefined();
        expect(manifest.extensionPoints.graphql).toBeDefined();
        expect(manifest.extensionPoints.database).toBeDefined();
        expect(manifest.extensionPoints.graphql[0].type).toBe('query');
        expect(manifest.extensionPoints.database[0].type).toBe('table');
      } finally {
        rmSync(tempDir, { recursive: true, force: true });
      }
    });

    it('should generate valid TypeScript files', () => {
      const tempDir = mkdtempSync(join(tmpdir(), 'plugin-test-'));

      try {
        createAdminSkeleton('TestPlugin', tempDir);

        const indexPath = join(tempDir, 'TestPlugin/admin/index.tsx');
        const indexContent = readFileSync(indexPath, 'utf-8');

        // Should contain valid React/TypeScript code
        expect(indexContent).toContain('export default');
        expect(indexContent).toContain('TestPlugin');

        // Verify lifecycle hooks
        expect(indexContent).toContain('onActivate');
        expect(indexContent).toContain('onDeactivate');
        expect(indexContent).toContain('onInstall');
        expect(indexContent).toContain('onUninstall');

        // Verify API lifecycle hooks
        createAPISkeleton('TestPluginAPI', tempDir);
        const apiIndexPath = join(tempDir, 'TestPluginAPI/api/index.ts');
        const apiIndexContent = readFileSync(apiIndexPath, 'utf-8');
        expect(apiIndexContent).toContain('onLoad');
        expect(apiIndexContent).toContain('onActivate');
        expect(apiIndexContent).toContain('onDeactivate');
        expect(apiIndexContent).toContain('onUnload');
      } finally {
        rmSync(tempDir, { recursive: true, force: true });
      }
    });

    it('should handle name transformations correctly', () => {
      const tempDir = mkdtempSync(join(tmpdir(), 'plugin-test-names-'));

      try {
        const testCases = [
          {
            input: 'test-plugin',
            expectedName: 'TestPlugin',
            expectedId: 'testPlugin',
          },
          {
            input: 'test_plugin',
            expectedName: 'TestPlugin',
            expectedId: 'testPlugin',
          },
        ];

        testCases.forEach(({ input, expectedName, expectedId }) => {
          createAdminSkeleton(input, tempDir);

          const manifestPath = join(tempDir, `${input}/admin/manifest.json`);
          const manifest = JSON.parse(readFileSync(manifestPath, 'utf-8'));

          expect(manifest.name).toBe(expectedName);
          expect(manifest.pluginId).toBe(expectedId);

          const indexPath = join(tempDir, `${input}/admin/index.tsx`);
          const indexContent = readFileSync(indexPath, 'utf-8');
          expect(indexContent).toContain(expectedName);
        });
      } finally {
        rmSync(tempDir, { recursive: true, force: true });
      }
    });
  });

  describe('Error Handling', () => {
    let tempDir: string;

    beforeEach(() => {
      tempDir = mkdtempSync(join(tmpdir(), 'plugin-test-error-'));
    });

    afterEach(() => {
      if (existsSync(tempDir)) {
        rmSync(tempDir, { recursive: true, force: true });
      }
      vi.restoreAllMocks();
    });

    it('should throw error for empty plugin name', () => {
      expect(() => createAdminSkeleton('', tempDir)).toThrow(
        'Plugin name cannot be empty',
      );
      expect(() => createAPISkeleton('', tempDir)).toThrow(
        'Plugin name cannot be empty',
      );
      expect(() => createAdminSkeleton('   ', tempDir)).toThrow(
        'Plugin name cannot be empty',
      );
      expect(() => createAPISkeleton('   ', tempDir)).toThrow(
        'Plugin name cannot be empty',
      );
    });

    it('should throw error for invalid characters in plugin name', () => {
      const invalidNames = [
        'My Plugin',
        'Plugin!',
        'Plugin@123',
        'Plugin/Name',
      ];

      invalidNames.forEach((name) => {
        expect(() => createAdminSkeleton(name, tempDir)).toThrow(
          'Plugin name can only contain letters, numbers, hyphens, and underscores',
        );
        expect(() => createAPISkeleton(name, tempDir)).toThrow(
          'Plugin name can only contain letters, numbers, hyphens, and underscores',
        );
      });
    });

    it('should handle filesystem errors during admin generation', () => {
      // Mock mkdirSync to throw an error
      vi.mocked(mkdirSync).mockImplementation(() => {
        throw new Error('Permission denied');
      });

      expect(() => createAdminSkeleton('TestPlugin', tempDir)).toThrow(
        'Permission denied',
      );
    });

    it('should handle filesystem errors during API generation', () => {
      // Mock mkdirSync to throw an error
      vi.mocked(mkdirSync).mockImplementation(() => {
        throw new Error('Disk full');
      });

      expect(() => createAPISkeleton('TestPlugin', tempDir)).toThrow(
        'Disk full',
      );
    });
  });
});
