import { describe, it, expect, vi, beforeEach } from 'vitest';

import {
  validateZipFile,
  shouldIgnore,
  getPluginId,
} from '~/scripts/zip/createZip';
import * as fs from 'node:fs';

vi.mock('node:fs', async (importOriginal) => {
  const actual = await importOriginal<typeof import('node:fs')>();
  return {
    ...actual,
    statSync: vi.fn(),
    existsSync: vi.fn(),
    readFileSync: vi.fn(),
  };
});

describe('createZip Unit Tests', () => {
  describe('validateZipFile', () => {
    it('should validate valid zip file', async () => {
      vi.mocked(fs.statSync).mockReturnValue({
        size: 200,
      } as unknown as fs.Stats);
      await expect(validateZipFile('test.zip')).resolves.not.toThrow();
    });

    it('should throw if zip is too small', async () => {
      vi.mocked(fs.statSync).mockReturnValue({
        size: 50,
      } as unknown as fs.Stats);
      await expect(validateZipFile('test.zip')).rejects.toThrow(
        'Zip file is too small',
      );
    });

    it('should throw if statSync fails', async () => {
      vi.mocked(fs.statSync).mockImplementation(() => {
        throw new Error('File not found');
      });
      await expect(validateZipFile('test.zip')).rejects.toThrow(
        'Zip validation failed: Error: File not found',
      );
    });
  });

  describe('shouldIgnore', () => {
    it('should ignore ignored directories', () => {
      expect(shouldIgnore('/path/.git', '.git', true)).toBe(true);
      expect(shouldIgnore('/path/.svn', '.svn', true)).toBe(true);
      expect(shouldIgnore('/path/__MACOSX', '__MACOSX', true)).toBe(true);
    });

    it('should ignore ignored files', () => {
      expect(shouldIgnore('/path/.DS_Store', '.DS_Store', false)).toBe(true);
      expect(shouldIgnore('/path/Thumbs.db', 'Thumbs.db', false)).toBe(true);
    });

    it('should not ignore normal files and directories', () => {
      expect(shouldIgnore('/path/src', 'src', true)).toBe(false);
      expect(shouldIgnore('/path/index.ts', 'index.ts', false)).toBe(false);
      // Directory with same name as ignored file?
      expect(shouldIgnore('/path/.DS_Store', '.DS_Store', true)).toBe(false);
      // File with same name as ignored dir?
      expect(shouldIgnore('/path/.git', '.git', false)).toBe(false);
    });
  });

  describe('getPluginId', () => {
    beforeEach(() => {
      vi.resetAllMocks();
    });

    it('should return id from root manifest', async () => {
      vi.mocked(fs.existsSync).mockImplementation((path) =>
        path.toString().endsWith('manifest.json'),
      );
      vi.mocked(fs.readFileSync).mockReturnValue(
        JSON.stringify({ pluginId: 'root-id' }),
      );

      await expect(getPluginId('/plugin')).resolves.toBe('root-id');
    });

    it('should return id from admin manifest if root missing', async () => {
      vi.mocked(fs.existsSync).mockImplementation((path) =>
        path.toString().includes('admin/manifest.json'),
      );
      vi.mocked(fs.readFileSync).mockReturnValue(
        JSON.stringify({ pluginId: 'admin-id' }),
      );

      await expect(getPluginId('/plugin')).resolves.toBe('admin-id');
    });

    it('should return id from api manifest if root/admin missing', async () => {
      vi.mocked(fs.existsSync).mockImplementation((path) =>
        path.toString().includes('api/manifest.json'),
      );
      vi.mocked(fs.readFileSync).mockReturnValue(
        JSON.stringify({ pluginId: 'api-id' }),
      );

      await expect(getPluginId('/plugin')).resolves.toBe('api-id');
    });

    it('should fallback to folder name if no manifest found', async () => {
      vi.mocked(fs.existsSync).mockReturnValue(false);
      await expect(getPluginId('/path/to/fallback-plugin')).resolves.toBe(
        'fallback-plugin',
      );
    });

    it('should fallback to folder name if manifest missing pluginId', async () => {
      vi.mocked(fs.existsSync).mockReturnValue(true);
      vi.mocked(fs.readFileSync).mockReturnValue(
        JSON.stringify({ someField: 'value' }),
      );
      await expect(getPluginId('/path/to/fallback-plugin')).resolves.toBe(
        'fallback-plugin',
      );
    });

    it('should handle invalid manifest json gracefully', async () => {
      vi.mocked(fs.existsSync).mockReturnValue(true);
      vi.mocked(fs.readFileSync).mockReturnValue('invalid json');
      // Ensure invalid manifest JSON is ignored and fallback logic is used
      await expect(getPluginId('/plugin')).resolves.toBe('plugin');
    });
  });
});
