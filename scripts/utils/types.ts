/**
 * Shared types for plugin manifest validation
 */
export interface PluginManifest {
  name: string;
  pluginId: string;
  version: string;
  description: string;
  author: string;
  main?: string;
  icon?: string;
  extensionPoints?: Record<string, unknown[]>;
}

/**
 * Simple semantic versioning regex (supports x.y.z format only).
 * Does not support pre-release identifiers or build metadata.
 * Examples: 1.0.0, 2.3.4, 10.20.30
 */
export const SEMVER_SIMPLE_REGEX = /^\d+\.\d+\.\d+$/;
