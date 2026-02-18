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

describe('validateExtensionPoints - Admin Extensions', () => {
  const mockPluginRoot = '/mock/plugin/root';

  beforeEach(() => {
    vi.resetAllMocks();
  });

  it('should validate admin:menu with title, path, and icon', async () => {
    const manifest: PluginManifest = {
      ...validManifest,
      extensionPoints: {
        'admin:menu': [
          {
            name: 'dashboard',
            title: 'Dashboard',
            path: '/dashboard',
            icon: 'icon.png',
          },
        ],
      },
    };

    const result = await validateExtensionPoints(manifest, mockPluginRoot);
    expect(result.valid).toBe(true);
    expect(result.errors).toHaveLength(0);
  });

  it('should invalidate admin:menu without title', async () => {
    const manifest: PluginManifest = {
      ...validManifest,
      extensionPoints: {
        'admin:menu': [
          {
            name: 'dashboard',
            path: '/dashboard',
            // Missing title
          },
        ],
      },
    };

    const result = await validateExtensionPoints(manifest, mockPluginRoot);
    expect(result.valid).toBe(false);
    expect(result.errors[0]).toContain('Missing or invalid "title"');
  });

  it('should invalidate admin:menu without path', async () => {
    const manifest: PluginManifest = {
      ...validManifest,
      extensionPoints: {
        'admin:menu': [
          {
            name: 'dashboard',
            title: 'Dashboard',
            // Missing path
          },
        ],
      },
    };

    const result = await validateExtensionPoints(manifest, mockPluginRoot);
    expect(result.valid).toBe(false);
    expect(result.errors[0]).toContain('Missing or invalid "path"');
  });

  it('should invalidate admin:menu with invalid icon type', async () => {
    const manifest: PluginManifest = {
      ...validManifest,
      extensionPoints: {
        'admin:menu': [
          {
            name: 'dashboard',
            title: 'Dashboard',
            path: '/dashboard',
            icon: 123 as any, // Invalid type
          },
        ],
      },
    };

    const result = await validateExtensionPoints(manifest, mockPluginRoot);
    expect(result.valid).toBe(false);
    expect(result.errors[0]).toContain('Invalid "icon"');
  });

  it('should validate admin:widget extension', async () => {
    const manifest: PluginManifest = {
      ...validManifest,
      extensionPoints: {
        'admin:widget': [
          {
            name: 'myWidget',
            file: 'widget.tsx', // Using file
            builderDefinition: 'MyWidget',
          },
        ],
      },
    };

    vi.mocked(fs.access).mockResolvedValue(undefined);
    vi.mocked(fs.readFile).mockResolvedValue(
      'export const MyWidget = () => {};',
    );
    const result = await validateExtensionPoints(manifest, mockPluginRoot);
    expect(result.valid).toBe(true);
  });

  it('should invalidate admin:widget without file or component', async () => {
    const manifest: PluginManifest = {
      ...validManifest,
      extensionPoints: {
        'admin:widget': [
          {
            name: 'myWidget',
            // Missing file/component
          },
        ],
      },
    };

    const result = await validateExtensionPoints(manifest, mockPluginRoot);
    expect(result.valid).toBe(false);
    expect(result.errors).toEqual(
      expect.arrayContaining([
        expect.stringContaining('Missing "file" or "component"'),
      ]),
    );
  });

  it('should validate admin:routes extension', async () => {
    const manifest: PluginManifest = {
      ...validManifest,
      extensionPoints: {
        'admin:routes': [
          {
            name: 'myRoute',
            component: 'RouteComponent.tsx', // Using component
            path: '/my-route',
          },
        ],
      },
    };

    vi.mocked(fs.access).mockResolvedValue(undefined);
    // No builderDefinition, so no export check, just existence
    const result = await validateExtensionPoints(manifest, mockPluginRoot);
    expect(result.valid).toBe(true);
  });

  it('should invalidate admin:routes without path', async () => {
    const manifest: PluginManifest = {
      ...validManifest,
      extensionPoints: {
        'admin:routes': [
          {
            name: 'myRoute',
            component: 'RouteComponent.tsx',
            // Missing path
          },
        ],
      },
    };

    vi.mocked(fs.access).mockResolvedValue(undefined);
    const result = await validateExtensionPoints(manifest, mockPluginRoot);
    expect(result.valid).toBe(false);
    expect(result.errors).toEqual(
      expect.arrayContaining([
        expect.stringContaining(
          'Missing or invalid "path" in extension point "admin:routes"',
        ),
      ]),
    );
  });

  it('should invalidate admin:widget with non-string file type', async () => {
    const manifest: PluginManifest = {
      ...validManifest,
      extensionPoints: {
        'admin:widget': [
          {
            name: 'myWidget',
            file: 123 as any, // Invalid type
          },
        ],
      },
    };

    const result = await validateExtensionPoints(manifest, mockPluginRoot);
    expect(result.valid).toBe(false);
    expect(result.errors[0]).toContain('Invalid type for "file"');
  });

  it('should invalidate admin:menu without name AND title', async () => {
    const manifest: PluginManifest = {
      ...validManifest,
      extensionPoints: {
        'admin:menu': [
          {
            // Missing name AND title
            path: '/dashboard',
          },
        ],
      },
    };

    const result = await validateExtensionPoints(manifest, mockPluginRoot);
    expect(result.valid).toBe(false);
    expect(result.errors[0]).toContain(
      'Missing "name" (or "title") in extension point "admin:menu"',
    );
  });

  it('should infer name from title for admin:menu', async () => {
    const manifest: PluginManifest = {
      ...validManifest,
      extensionPoints: {
        'admin:menu': [
          {
            // No name, but title present
            title: 'Inferred Name',
            path: '/inferred',
          },
        ],
      },
    };

    const result = await validateExtensionPoints(manifest, mockPluginRoot);
    expect(result.valid).toBe(true);
    // Internally extName should be 'Inferred Name', so check no "Missing name" error
    expect(result.errors).toHaveLength(0);
  });

  it('should invalidate admin:widget when component is non-string (even if file is valid)', async () => {
    const manifest: PluginManifest = {
      ...validManifest,
      extensionPoints: {
        'admin:widget': [
          {
            name: 'myWidget',
            file: 'widget.tsx', // Valid string
            component: 123 as any, // Invalid type
          },
        ],
      },
    };

    vi.mocked(fs.access).mockResolvedValue(undefined);
    vi.mocked(fs.readFile).mockResolvedValue(
      'export const MyWidget = () => {};',
    );

    const result = await validateExtensionPoints(manifest, mockPluginRoot);
    expect(result.valid).toBe(false);
    expect(result.errors).toEqual(
      expect.arrayContaining([
        expect.stringContaining('Invalid type for "component"'),
      ]),
    );
  });
  it('should invalidate admin:menu with non-string title type', async () => {
    const manifest: PluginManifest = {
      ...validManifest,
      extensionPoints: {
        'admin:menu': [
          {
            name: 'dashboard',
            title: 123 as any, // Invalid type
            path: '/dashboard',
          },
        ],
      },
    };

    const result = await validateExtensionPoints(manifest, mockPluginRoot);
    expect(result.valid).toBe(false);
    expect(result.errors[0]).toContain('Missing or invalid "title"');
  });

  it('should invalidate admin:menu with non-string path type', async () => {
    const manifest: PluginManifest = {
      ...validManifest,
      extensionPoints: {
        'admin:menu': [
          {
            name: 'dashboard',
            title: 'Dashboard',
            path: 123 as any, // Invalid type
          },
        ],
      },
    };

    const result = await validateExtensionPoints(manifest, mockPluginRoot);
    expect(result.valid).toBe(false);
    expect(result.errors[0]).toContain('Missing or invalid "path"');
  });

  it('should invalidate admin:routes with non-string path type', async () => {
    const manifest: PluginManifest = {
      ...validManifest,
      extensionPoints: {
        'admin:routes': [
          {
            name: 'myRoute',
            component: 'RouteComponent.tsx',
            path: 123 as any, // Invalid type
          },
        ],
      },
    };

    vi.mocked(fs.access).mockResolvedValue(undefined);
    const result = await validateExtensionPoints(manifest, mockPluginRoot);
    expect(result.valid).toBe(false);
    expect(result.errors).toEqual(
      expect.arrayContaining([
        expect.stringContaining('Missing or invalid "path"'),
      ]),
    );
  });

  it('should invalidate admin:widget with only non-string component', async () => {
    const manifest: PluginManifest = {
      ...validManifest,
      extensionPoints: {
        'admin:widget': [
          {
            name: 'myWidget',
            component: 123 as any, // Invalid type, no file
          },
        ],
      },
    };

    const result = await validateExtensionPoints(manifest, mockPluginRoot);
    expect(result.valid).toBe(false);
    expect(result.errors[0]).toContain('Invalid type for "component"');
  });
});
