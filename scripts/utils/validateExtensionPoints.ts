import { promises as fs } from 'fs';
import * as path from 'path';
import { PluginManifest } from './types';
import { ValidationResult } from './validateManifest';

interface ExtensionPoint {
  type?: string;
  name?: string;
  id?: string;
  file?: string;
  builderDefinition?: string;
  [key: string]: unknown;
}

function escapeRegExp(string: string): string {
  return string.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
}

/**
 * Validates extension points in a plugin manifest.
 *
 * Checks:
 * 1. Schema validation (required fields, types)
 * 2. File existence
 * 3. Function exports (files must export the builderDefinition)
 * 4. Name collision
 */
export async function validateExtensionPoints(
  manifest: PluginManifest,
  pluginRoot: string,
): Promise<ValidationResult> {
  const errors: string[] = [];
  const extensionPoints = manifest.extensionPoints;

  if (!extensionPoints) {
    return { valid: true, errors: [] };
  }

  /*
   * Enforce global uniqueness of extension names across all extension points.
   * This prevents collisions when extensions are registered in a flat namespace
   * or when looking up extensions by name.
   */
  const registeredExtensions = new Map<string, string>();

  // Defensive check: ensure extensionPoints is an object and not an array
  if (typeof extensionPoints !== 'object' || Array.isArray(extensionPoints)) {
    return {
      valid: false,
      errors: ['"extensionPoints" must be an object'],
    };
  }

  // Helper for file validation to reuse across api and admin extensions
  const validateExtensionFile = async (
    file: string,
    builderDef: string | undefined,
    extIdent: string,
    requireExport: boolean,
  ) => {
    // 2. Safe File Existence & Path Traversal Check
    try {
      const normalizedRoot = path.resolve(pluginRoot);
      const resolvedPath = path.resolve(normalizedRoot, file);

      // Resolve real paths to handle symlinks and ensure strict containment
      const realPluginRoot = await fs.realpath(normalizedRoot);

      // Check relative path BEFORE accessing the file to prevent traversal attacks
      const relLogical = path.relative(normalizedRoot, resolvedPath);
      if (relLogical.startsWith('..') || path.isAbsolute(relLogical)) {
        errors.push(
          `File "${file}" for extension "${extIdent}" is outside plugin root`,
        );
        return;
      }

      await fs.access(resolvedPath);
      const realResolvedPath = await fs.realpath(resolvedPath);
      const relReal = path.relative(realPluginRoot, realResolvedPath);

      if (relReal.startsWith('..') || path.isAbsolute(relReal)) {
        errors.push(
          `File "${file}" for extension "${extIdent}" resolves to outside plugin root (symlink?)`,
        );
        return;
      }

      // 3. Function Exports
      if (requireExport && builderDef) {
        try {
          const fileContent = await fs.readFile(realResolvedPath, 'utf-8');
          const safeDef = escapeRegExp(builderDef);

          // NOTE: avoid `export type` (erased at runtime). Also avoid `\b` since `$` isn't a `\w` char.
          const exportRegex = new RegExp(
            `export\\s+(const|function|async\\s+function|class)\\s+${safeDef}(?![\\w$])|` +
              `export\\s+default\\s+(function|class|async\\s+function)\\s+${safeDef}(?![\\w$])|` +
              `export\\s+default\\s+${safeDef}(?![\\w$])|` +
              `export\\s*{[^}]*\\b(?:\\w+\\s+as\\s+)?${safeDef}(?![\\w$])[^}]*}`,
            'm',
          );

          if (!exportRegex.test(fileContent)) {
            errors.push(
              `Function "${builderDef}" is not exported from "${file}"`,
            );
          }
        } catch (e) {
          errors.push(`Error reading file "${file}" for export check: ${e}`);
        }
      }
    } catch (err: unknown) {
      const errorMessage = err instanceof Error ? err.message : String(err);
      errors.push(
        `File "${file}" not found for extension "${extIdent}": ${errorMessage}`,
      );
    }
  };

  for (const [pointId, extensions] of Object.entries(extensionPoints)) {
    if (!Array.isArray(extensions)) {
      errors.push(`Extension point "${pointId}" must be an array`);
      continue;
    }

    for (let i = 0; i < extensions.length; i++) {
      const ext = extensions[i] as ExtensionPoint;
      let extName = ext.name;

      // Special handling for admin:menu which uses 'title' as identifier if name is missing
      if (
        !extName &&
        pointId === 'admin:menu' &&
        ext.title &&
        typeof ext.title === 'string'
      ) {
        extName = ext.title;
      }

      const extIdent = extName ?? ext.id ?? `index ${i}`;

      // 1. Schema Validation
      // Check if name is missing, empty, or not a string
      if (!extName || typeof extName !== 'string') {
        if (pointId === 'admin:menu') {
          errors.push(
            `Missing "name" (or "title") in extension point "${pointId}"`,
          );
        } else {
          errors.push(`Missing "name" in extension point "${pointId}"`);
        }
      } else {
        if (registeredExtensions.has(extName)) {
          const existingPoint = registeredExtensions.get(extName);
          errors.push(
            `Duplicate extension name "${extName}" found in "${pointId}" (already defined in "${existingPoint}")`,
          );
        } else {
          registeredExtensions.set(extName, pointId);
        }
      }

      // Specific checks
      if (pointId.startsWith('api:')) {
        if (!ext.type) {
          errors.push(
            `Missing "type" in extension point "${pointId}" (entry: ${extIdent})`,
          );
        } else if (
          pointId === 'api:graphql' &&
          !['query', 'mutation', 'subscription', 'type'].includes(ext.type)
        ) {
          errors.push(
            `Invalid graphql type "${ext.type}" for extension "${extIdent}". local type must be one of: query, mutation, subscription, type`,
          );
        }

        if (ext.file !== undefined) {
          if (typeof ext.file !== 'string') {
            errors.push(
              `Invalid type for "file" in extension "${extIdent}" (must be string)`,
            );
          } else if (
            ext.builderDefinition !== undefined &&
            typeof ext.builderDefinition !== 'string'
          ) {
            errors.push(
              `Invalid type for "builderDefinition" in extension "${extIdent}" (must be string)`,
            );
          } else {
            await validateExtensionFile(
              ext.file,
              ext.builderDefinition,
              extIdent,
              true,
            );
          }
        } else if (pointId === 'api:graphql' || pointId === 'api:rest') {
          errors.push(`Missing "file" for extension "${extIdent}"`);
        }
      } else if (pointId.startsWith('admin:')) {
        if (pointId === 'admin:menu') {
          if (!ext.title || typeof ext.title !== 'string') {
            errors.push(
              `Missing or invalid "title" in extension point "${pointId}" (entry: ${extIdent})`,
            );
          }
          if (!ext.path || typeof ext.path !== 'string') {
            errors.push(
              `Missing or invalid "path" in extension point "${pointId}" (entry: ${extIdent})`,
            );
          }
          if (ext.icon && typeof ext.icon !== 'string') {
            errors.push(
              `Invalid "icon" in extension point "${pointId}" (entry: ${extIdent})`,
            );
          }
        } else if (pointId === 'admin:widget' || pointId === 'admin:routes') {
          if (!ext.file && !ext.component) {
            errors.push(
              `Missing "file" or "component" for extension "${extIdent}" in "${pointId}"`,
            );
          }

          // Validate type of ext.file if present
          if (ext.file !== undefined && typeof ext.file !== 'string') {
            errors.push(
              `Invalid type for "file" in extension "${extIdent}" in "${pointId}" (must be string)`,
            );
          }

          // Validate type of ext.component if present
          if (
            ext.component !== undefined &&
            typeof ext.component !== 'string'
          ) {
            errors.push(
              `Invalid type for "component" in extension "${extIdent}" in "${pointId}" (must be string)`,
            );
          }

          // Proceed with file validation if we have a valid string path
          const filePath = ext.file || ext.component;
          if (typeof filePath === 'string') {
            await validateExtensionFile(
              filePath,
              ext.builderDefinition,
              extIdent,
              !!ext.builderDefinition,
            );
          }
        }

        // validation for admin:routes path
        if (pointId === 'admin:routes') {
          if (!ext.path || typeof ext.path !== 'string') {
            errors.push(
              `Missing or invalid "path" in extension point "${pointId}" (entry: ${extIdent})`,
            );
          }
        }
      }
    }
  }

  return {
    valid: errors.length === 0,
    errors,
  };
}
