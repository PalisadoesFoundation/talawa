import { PluginManifest } from '../../scripts/utils/types';

export const validManifest: PluginManifest = {
  name: 'Test Plugin',
  pluginId: 'test-plugin',
  version: '1.0.0',
  description: 'A test plugin for validation',
  author: 'Test Author',
  main: 'index.ts',
  icon: 'icon.png',
  extensionPoints: {
    'api:graphql': [
      {
        type: 'query',
        name: 'hello',
        file: 'queries.ts',
        builderDefinition: 'helloQuery',
      },
    ],
  },
};

export const invalidManifest: Partial<PluginManifest> = {
  name: '', // Invalid: empty string
  pluginId: 'Test Plugin', // Invalid: spaces and uppercase
  version: '1.0', // Invalid: not semver
};

export const validExtensionPointManifest: PluginManifest = {
  name: 'Extension Plugin',
  pluginId: 'extension-plugin',
  version: '1.0.0',
  description: 'Plugin with extensions',
  author: 'Test Author',
  extensionPoints: {
    'api:graphql': [
      {
        type: 'query',
        name: 'testQuery',
        file: 'resolvers.ts',
        builderDefinition: 'registerQuery',
      },
    ],
    'admin:menu': [
      {
        title: 'Dashboard',
        path: '/dashboard',
        icon: 'dashboard-icon',
      },
    ],
  },
};
