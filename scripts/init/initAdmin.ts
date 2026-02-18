// scripts/initAdmin.ts
import { spinner } from '@clack/prompts';
import { mkdirSync, writeFileSync } from 'node:fs';
import { join } from 'node:path';

/**
 * Scaffolds the Admin (web) part of a plugin.
 *
 * tree:
 * plugins/<name>/admin/
 * ├─ pages/
 * │  └─ index.tsx
 * ├─ assets/
 * │  └─ image.png
 * ├─ injector/
 * │  └─ IconInjector.tsx
 * ├─ index.tsx
 * ├─ manifest.json
 * ├─ info.json
 * └─ README.md
 */
export function createAdminSkeleton(
  pluginName: string,
  pluginsRoot = 'plugins',
): void {
  if (!pluginName || pluginName.trim() === '') {
    throw new Error('Plugin name cannot be empty');
  }

  if (!/^[a-zA-Z0-9-_]+$/.test(pluginName)) {
    throw new Error(
      'Plugin name can only contain letters, numbers, hyphens, and underscores',
    );
  }

  const s = spinner();
  s.start('Creating Admin skeleton…');

  const adminRoot = join(pluginsRoot, pluginName, 'admin');
  const pagesDir = join(adminRoot, 'pages');
  const assetsDir = join(adminRoot, 'assets');
  const injectorDir = join(adminRoot, 'injector');

  // Create all dirs
  [pagesDir, assetsDir, injectorDir].forEach((d) =>
    mkdirSync(d, { recursive: true }),
  );

  /* ─────────── pages/index.tsx ─────────── */
  writeFileSync(
    join(pagesDir, 'index.tsx'),
    `import React from 'react';

/**
 * Main page component for the ${pascal(pluginName)} Admin module.
 */
const ${pascal(pluginName)}Page: React.FC = () => {
  return (
    <div className="p-6">
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900">${pascal(pluginName)}</h1>
        <p className="text-gray-600 mt-2">
          Welcome to the ${pluginName} plugin administration panel.
        </p>
      </div>
      
      <div className="bg-white rounded-lg shadow p-6">
        <h2 className="text-lg font-semibold mb-4">${pascal(pluginName)} Overview</h2>
        <p className="text-gray-700">
          This is the main page for managing ${pluginName} functionality.
          Add your plugin-specific content here.
        </p>
      </div>
    </div>
  );
};

export default ${pascal(pluginName)}Page;
`,
  );

  /* ─────────── injector/IconInjector.tsx ─────────── */
  writeFileSync(
    join(injectorDir, 'IconInjector.tsx'),
    `import React from 'react';

/**
 * Icon injector component for ${pascal(pluginName)} plugin.
 * This component can be injected into various extension points throughout the admin interface.
 */
const ${pascal(pluginName)}IconInjector: React.FC = () => {
  return (
    <div className="inline-flex items-center px-2 py-1 rounded-full text-xs font-medium bg-blue-100 text-blue-800">
      <svg 
        className="w-3 h-3 mr-1" 
        fill="currentColor" 
        viewBox="0 0 20 20"
      >
        <path 
          fillRule="evenodd" 
          d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" 
          clipRule="evenodd" 
        />
      </svg>
      ${pascal(pluginName)}
    </div>
  );
};

export default ${pascal(pluginName)}IconInjector;
`,
  );

  /* ─────────── main index.tsx ─────────── */
  writeFileSync(
    join(adminRoot, 'index.tsx'),
    `/**
 * ${pascal(pluginName)} Plugin for Talawa Admin
 *
 * This plugin provides ${pluginName} functionality for the Talawa Admin Panel.
 * It extends the admin interface with new features and capabilities.
 */

import { IPluginLifecycle } from '../../types';

// Import all components
import ${pascal(pluginName)}Page from './pages';
import ${pascal(pluginName)}IconInjector from './injector/IconInjector';

// Plugin lifecycle implementation
const ${pascal(pluginName)}Lifecycle: IPluginLifecycle = {
  onActivate: async () => {
    console.log('${pascal(pluginName)} plugin activated');

    // Initialize plugin-specific data
    try {
      // Set up ${pluginName} functionality
      console.log('${pascal(pluginName)} functionality initialized');
      
      // Initialize UI components
      console.log('${pascal(pluginName)} UI components ready');
      
      console.log('${pascal(pluginName)} initialization completed');
    } catch (error) {
      console.error('${pascal(pluginName)} initialization failed:', error);
    }
  },

  onDeactivate: async () => {
    console.log('${pascal(pluginName)} plugin deactivated');

    // Cleanup plugin-specific resources
    try {
      // Clean up ${pluginName} functionality
      console.log('${pascal(pluginName)} functionality cleaned up');
      
      // Remove UI components
      console.log('${pascal(pluginName)} UI components deactivated');
      
      console.log('${pascal(pluginName)} cleanup completed');
    } catch (error) {
      console.error('${pascal(pluginName)} cleanup failed:', error);
    }
  },

  onInstall: async () => {
    console.log('${pascal(pluginName)} plugin installed');

    // Perform installation tasks
    try {
      // This could include:
      // - Setting up ${pluginName} data
      // - Creating initial configuration
      // - Setting up UI components
      console.log('${pascal(pluginName)} installation completed');
    } catch (error) {
      console.error('${pascal(pluginName)} installation failed:', error);
      throw error; // Re-throw to indicate installation failure
    }
  },

  onUninstall: async () => {
    console.log('${pascal(pluginName)} plugin uninstalled');

    // Perform uninstallation cleanup
    try {
      // This could include:
      // - Removing ${pluginName} data
      // - Cleaning up configuration
      // - Removing UI components
      console.log('${pascal(pluginName)} uninstallation completed');
    } catch (error) {
      console.error('${pascal(pluginName)} uninstallation failed:', error);
      throw error; // Re-throw to indicate uninstallation failure
    }
  },

  onUpdate: async (fromVersion: string, toVersion: string) => {
    console.log(\`${pascal(pluginName)} plugin updated from \${fromVersion} to \${toVersion}\`);

    // Perform version-specific updates
    try {
      // This could include:
      // - Updating ${pluginName} data structure
      // - Migrating configuration
      // - Updating UI components
      console.log('${pascal(pluginName)} update completed');
    } catch (error) {
      console.error('${pascal(pluginName)} update failed:', error);
      throw error; // Re-throw to indicate update failure
    }
  },
};

// Export the lifecycle as default
export default ${pascal(pluginName)}Lifecycle;

// Export all components
export {
  ${pascal(pluginName)}Page,
  ${pascal(pluginName)}IconInjector,
};
`,
  );

  /* ─────────── manifest.json ─────────── */
  writeFileSync(
    join(adminRoot, 'manifest.json'),
    JSON.stringify(
      {
        name: pascal(pluginName),
        pluginId: camelCase(pluginName),
        version: '1.0.0',
        description: `A ${pluginName} plugin that provides ${pluginName} functionality for the Talawa Admin Panel.`,
        author: 'Palisadoes Foundation',
        main: 'index.tsx',
        icon: '/src/assets/svgs/plugins.svg',
        extensionPoints: {
          RA1: [
            {
              path: `/admin/${camelCase(pluginName)}`,
              component: `${pascal(pluginName)}Page`,
            },
          ],
          DA1: [
            {
              label: pascal(pluginName),
              icon: '/src/assets/svgs/plugins.svg',
              path: `/admin/${camelCase(pluginName)}`,
              order: 1,
            },
          ],
          G1: [
            {
              injector: `${pascal(pluginName)}IconInjector`,
              description: `${pascal(pluginName)} icon indicator showing plugin availability`,
            },
          ],
        },
      },
      null,
      2,
    ),
  );

  /* ─────────── info.json ─────────── */
  writeFileSync(
    join(adminRoot, 'info.json'),
    JSON.stringify(
      {
        name: pascal(pluginName),
        version: '1.0.0',
        description: `${pascal(pluginName)} plugin for Talawa Admin`,
        author: 'Palisadoes Foundation',
        homepage: 'https://github.com/PalisadoesFoundation/talawa',
        repository: {
          type: 'git',
          url: 'https://github.com/PalisadoesFoundation/talawa.git',
        },
        bugs: {
          url: 'https://github.com/PalisadoesFoundation/talawa/issues',
        },
        license: 'MIT',
        dependencies: {},
        devDependencies: {},
        peerDependencies: {
          react: '^18.0.0',
          'react-dom': '^18.0.0',
        },
        keywords: ['talawa', 'plugin', 'admin', camelCase(pluginName)],
        engines: {
          node: '>=16.0.0',
        },
      },
      null,
      2,
    ),
  );

  /* ─────────── README.md ─────────── */
  writeFileSync(
    join(adminRoot, 'README.md'),
    `# ${pascal(pluginName)} – Admin module

This folder contains the React code that extends **Talawa-Admin**.

## Structure

- \`pages/\` - React components for plugin pages
- \`assets/\` - Static assets like images, icons, etc.
- \`injector/\` - Components that can be injected into extension points
- \`index.tsx\` - Main plugin entry point with lifecycle hooks
- \`manifest.json\` - Plugin metadata and extension point definitions
- \`info.json\` - Package information and dependencies

## Extension Points

This plugin registers the following extension points:

- **RA1**: Admin route at \`/admin/${camelCase(pluginName)}\`
- **DA1**: Dashboard navigation item for ${pascal(pluginName)}
- **G1**: Global icon injector for ${pascal(pluginName)} indicator

## Development

To develop this plugin:

1. Import your components in \`index.tsx\`
2. Register them in \`manifest.json\` under the appropriate extension points
3. Implement lifecycle hooks as needed
4. Add any required dependencies to \`info.json\`

## Usage

The plugin will be automatically loaded by the Talawa Admin Plugin Manager
and its components will be mounted at the registered extension points.
`,
  );

  /* ─────────── assets/placeholder.txt ─────────── */
  writeFileSync(
    join(assetsDir, 'placeholder.txt'),
    `This directory is for static assets like images, icons, and other media files.

Replace this file with your actual assets:
- logo.png
- icon.svg
- banner.jpg
- etc.

The assets can be referenced in your components using relative paths.
`,
  );

  s.stop('Admin skeleton created.');
}

/* ─────────────────────────────────────── */
function pascal(str: string): string {
  return str
    .split(/[-_]/)
    .map((w) => w.charAt(0).toUpperCase() + w.slice(1))
    .join('');
}

function camelCase(str: string): string {
  return str
    .split(/[-_]/)
    .map((w, i) =>
      i === 0
        ? w.toLowerCase()
        : w.charAt(0).toUpperCase() + w.slice(1).toLowerCase(),
    )
    .join('');
}
