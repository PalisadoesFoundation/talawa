// scripts/initApp.ts
import { spinner } from '@clack/prompts';
import { mkdirSync, writeFileSync } from 'node:fs';
import { join } from 'node:path';

/**
 * Scaffolds the Mobile/App portion (Flutter) of a plugin.
 *
 * tree:
 * plugins/<name>/mobile/
 * ├─ lib/
 * │  └─ plugin_entry.dart
 * └─ README.md
 */
export function createAppSkeleton(
  pluginName: string,
  pluginsRoot = 'plugins',
): void {
  const s = spinner();
  s.start('Creating Mobile/App skeleton…');

  const appRoot = join(pluginsRoot, pluginName, 'mobile');
  const libDir = join(appRoot, 'lib');

  mkdirSync(libDir, { recursive: true });

  // Simple Flutter entry widget
  writeFileSync(
    join(libDir, 'plugin_entry.dart'),
    `import 'package:flutter/material.dart';

class ${pascal(pluginName)}Screen extends StatelessWidget {
  const ${pascal(pluginName)}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('${pluginName}')),
      body: const Center(child: Text('Hello from ${pluginName}!')),
    );
  }
}
`,
  );

  writeFileSync(
    join(appRoot, 'README.md'),
    `# ${pluginName} – Mobile module

Describe Flutter routes, widgets, and feature flags here.
`,
  );

  s.stop('Mobile/App skeleton created.');
}

// ──────────────────────────────────────────────────────────────
function pascal(str: string): string {
  return str
    .split(/[-_]/)
    .map((w) => w.charAt(0).toUpperCase() + w.slice(1))
    .join('');
}
