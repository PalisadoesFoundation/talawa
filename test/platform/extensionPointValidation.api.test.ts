import { describe, it, expect, vi, beforeEach } from 'vitest';
import { promises as fs } from 'fs';
import { validateExtensionPoints } from '../../scripts/utils/validateExtensionPoints';
import { PluginManifest } from '../../scripts/utils/types';
import { validManifest } from '../utils/fixtures';

// Mock fs.promises
vi.mock('fs', async () => {
  const actual = await vi.importActual<typeof import('fs')>('fs');
  return {
    ...actual,
    promises: {
      ...actual.promises,
      access: vi.fn(),
      readFile: vi.fn(),
      realpath: vi.fn((path) => Promise.resolve(path)),
    },
  };
});

describe('validateExtensionPoints - API & exports', () => {
  const mockPluginRoot = '/mock/plugin/root';

  beforeEach(() => {
    vi.resetAllMocks();
  });

  it('should handle extension with file but no builderDefinition', async () => {
    const manifest: PluginManifest = {
      ...validManifest,
      extensionPoints: {
        'api:graphql': [
          {
            type: 'query',
            name: 'myQuery',
            file: 'query.ts',
            // builderDefinition missing
          },
        ],
      },
    };

    vi.mocked(fs.access).mockResolvedValue(undefined);
    const result = await validateExtensionPoints(manifest, mockPluginRoot);
    // Should be valid as export check is skipped, but file existence is checked
    expect(result.valid).toBe(true);
  });

  it('should validate manifest with both api and admin extensions', async () => {
    const manifest: PluginManifest = {
      ...validManifest,
      extensionPoints: {
        'api:graphql': [
          {
            type: 'query',
            name: 'myQuery',
            file: 'query.ts',
            builderDefinition: 'myQuery',
          },
        ],
        'admin:menu': [
          {
            name: 'dashboard',
            title: 'Dashboard',
            path: '/dashboard',
          },
        ],
      },
    };

    vi.mocked(fs.access).mockResolvedValue(undefined);
    vi.mocked(fs.readFile).mockResolvedValue('export const myQuery = {};');

    const result = await validateExtensionPoints(manifest, mockPluginRoot);
    expect(result.valid).toBe(true);
    expect(result.errors).toHaveLength(0);
  });

  it('should invalidate missing type for api:* extensions', async () => {
    const manifest: PluginManifest = {
      ...validManifest,
      extensionPoints: {
        'api:graphql': [
          {
            name: 'myQuery',
            file: 'query.ts',
            builderDefinition: 'myQuery',
            // Missing type
          },
        ],
      },
    };

    // Explicitly mock fs.access to resolve (file exists)
    vi.mocked(fs.access).mockResolvedValue(undefined);
    // Mock readFile to prevent incidental errors
    vi.mocked(fs.readFile).mockResolvedValue('export const myQuery = {};');

    const result = await validateExtensionPoints(manifest, mockPluginRoot);
    expect(result.valid).toBe(false);
    expect(result.errors).toEqual(
      expect.arrayContaining([
        expect.stringContaining('Missing "type" in extension point'),
      ]),
    );
  });

  it('should invalidate invalid graphql type', async () => {
    const manifest: PluginManifest = {
      ...validManifest,
      extensionPoints: {
        'api:graphql': [
          {
            type: 'invalid-type',
            name: 'myQuery',
            file: 'query.ts',
            builderDefinition: 'myQuery',
          },
        ],
      },
    };

    // We mock file access to succeed so it hits the type check logic fully
    vi.mocked(fs.access).mockResolvedValue(undefined);
    vi.mocked(fs.readFile).mockResolvedValue('export const myQuery = {};');

    const result = await validateExtensionPoints(manifest, mockPluginRoot);
    expect(result.valid).toBe(false);
    expect(result.errors).toEqual(
      expect.arrayContaining([
        expect.stringContaining('Invalid graphql type "invalid-type"'),
      ]),
    );
  });

  it('should validate function exports', async () => {
    const manifest: PluginManifest = {
      ...validManifest,
      extensionPoints: {
        'api:graphql': [
          {
            type: 'query',
            name: 'myQuery',
            file: 'query.ts',
            builderDefinition: 'myQuery',
          },
        ],
      },
    };

    // Mock file exists
    vi.mocked(fs.access).mockResolvedValue(undefined);
    // Mock file content missing export
    vi.mocked(fs.readFile).mockResolvedValue('const foo = "bar";');

    const result = await validateExtensionPoints(manifest, mockPluginRoot);
    expect(result.valid).toBe(false);
    expect(result.errors).toContain(
      'Function "myQuery" is not exported from "query.ts"',
    );
  });

  it('should pass given valid file and named export', async () => {
    const manifest: PluginManifest = {
      ...validManifest,
      extensionPoints: {
        'api:graphql': [
          {
            type: 'query',
            name: 'myQuery',
            file: 'query.ts',
            builderDefinition: 'myQuery',
          },
        ],
      },
    };

    vi.mocked(fs.access).mockResolvedValue(undefined);
    vi.mocked(fs.readFile).mockResolvedValue(
      'export const myQuery = () => {};',
    );

    const result = await validateExtensionPoints(manifest, mockPluginRoot);
    expect(result.valid).toBe(true);
    expect(result.errors).toHaveLength(0);
  });

  it('should pass given valid default export', async () => {
    const manifest: PluginManifest = {
      ...validManifest,
      extensionPoints: {
        'api:graphql': [
          {
            type: 'query',
            name: 'myQuery',
            file: 'query.ts',
            builderDefinition: 'defaultQuery',
          },
        ],
      },
    };

    vi.mocked(fs.access).mockResolvedValue(undefined);
    // "export default function defaultQuery..."
    vi.mocked(fs.readFile).mockResolvedValue(
      'export default function defaultQuery() {}',
    );

    const result = await validateExtensionPoints(manifest, mockPluginRoot);
    expect(result.valid).toBe(true);
    expect(result.errors).toHaveLength(0);
  });

  it('should detect duplicate names', async () => {
    const manifest: PluginManifest = {
      ...validManifest,
      extensionPoints: {
        'api:graphql': [
          {
            type: 'query',
            name: 'duplicateName',
            file: 'query1.ts',
            builderDefinition: 'query1',
          },
          {
            type: 'mutation',
            name: 'duplicateName',
            file: 'query2.ts',
            builderDefinition: 'query2',
          },
        ],
      },
    };

    vi.mocked(fs.access).mockResolvedValue(undefined);
    vi.mocked(fs.readFile).mockResolvedValue(
      'export const query1 = {}; export const query2 = {};',
    );

    const result = await validateExtensionPoints(manifest, mockPluginRoot);
    expect(result.valid).toBe(false);
    expect(result.errors).toEqual(
      expect.arrayContaining([
        expect.stringContaining('Duplicate extension name "duplicateName"'),
        expect.stringContaining('found in "api:graphql"'),
      ]),
    );
  });

  it('should pass given re-export syntax', async () => {
    const manifest: PluginManifest = {
      ...validManifest,
      extensionPoints: {
        'api:graphql': [
          {
            type: 'query',
            name: 'myQuery',
            file: 'index.ts',
            builderDefinition: 'myQuery',
          },
        ],
      },
    };

    vi.mocked(fs.access).mockResolvedValue(undefined);
    vi.mocked(fs.readFile).mockResolvedValue(
      "export { myQuery } from './queries';",
    );

    const result = await validateExtensionPoints(manifest, mockPluginRoot);
    expect(result.valid).toBe(true);
    expect(result.errors).toHaveLength(0);
  });

  it('should invalidate missing file for code-based extensions', async () => {
    const manifest: PluginManifest = {
      ...validManifest,
      extensionPoints: {
        'api:graphql': [
          {
            type: 'query',
            name: 'myQuery',
            // Missing file
            builderDefinition: 'myQuery',
          },
        ],
      },
    };

    const result = await validateExtensionPoints(manifest, mockPluginRoot);
    expect(result.valid).toBe(false);
    expect(result.errors).toEqual(
      expect.arrayContaining([
        expect.stringContaining('Missing "file" for extension'),
      ]),
    );
  });
});
