import { PluginManifest, SEMVER_SIMPLE_REGEX } from './types';

export interface ValidationResult {
  valid: boolean;
  errors: string[];
}

export function validateManifest(manifest: unknown): ValidationResult {
  const errors: string[] = [];

  // Type guard for basic object structure
  if (!manifest || typeof manifest !== 'object') {
    return { valid: false, errors: ['Manifest must be an object'] };
  }

  const m = manifest as Partial<PluginManifest>;

  // Required string fields
  const requiredFields: Array<keyof PluginManifest> = [
    'name',
    'pluginId',
    'version',
    'description',
    'author',
  ];

  for (const field of requiredFields) {
    if (!m[field]) {
      errors.push(`Missing required field: ${field}`);
    } else if (typeof m[field] !== 'string') {
      errors.push(`Field "${field}" must be a string`);
    } else if (m[field].trim().length === 0) {
      errors.push(`Field "${field}" must be a non-empty string`);
    }
  }

  // Optional string fields
  const optionalFields: Array<keyof PluginManifest> = ['main', 'icon'];

  for (const field of optionalFields) {
    if (m[field] !== undefined && typeof m[field] !== 'string') {
      errors.push(`Field "${field}" must be a string when provided`);
    }
  }

  // PluginId format (lowercase with hyphens/underscores)
  if (m.pluginId && !/^[a-z0-9_-]+$/.test(m.pluginId)) {
    errors.push(
      'Field "pluginId" must be lowercase with hyphens or underscores only',
    );
  }

  // Version format (semantic versioning)
  if (m.version && !SEMVER_SIMPLE_REGEX.test(m.version)) {
    errors.push(
      'Field "version" must follow semantic versioning (e.g., 1.0.0)',
    );
  }

  return {
    valid: errors.length === 0,
    errors,
  };
}
