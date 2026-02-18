---
id: admin-development
title: Admin Plugin Development Guide
slug: /developer-resources/admin/development
sidebar_position: 2
---

# Admin Plugin Development Guide

## Development Environment Setup

For instructions on setting up and running the Talawa Admin dashboard, refer to the main installation guide:

- [Admin Installation Documentation](https://docs-admin.talawa.io/docs/installation)

## Plugin Structure Overview

Admin plugins follow a standardized structure:

```
my-plugin/
├── manifest.json          # Plugin metadata and extension points
├── index.tsx              # Main entry point with lifecycle hooks
├── info.json              # Plugin display information
├── README.md              # Plugin documentation
├── assets/                # Images, icons, styles
│   └── icon.png
├── pages/                 # React components for routes
│   ├── Dashboard.tsx
│   └── Settings.tsx
├── injector/              # Components for injection points
│   └── CustomWidget.tsx
├── components/            # Reusable UI components
│   └── DataTable.tsx
├── hooks/                 # Custom React hooks
│   └── usePluginData.ts
├── utils/                 # Helper functions
│   └── formatters.ts
└── types/                 # TypeScript type definitions
    └── index.ts
```

## Plugin Manifest


The `manifest.json` defines your plugin and its extension points. Here is a sample including all extension point names and a single injector (G1):

```json
{
  "name": "My Awesome Plugin",
  "pluginId": "my_awesome_plugin",
  "version": "1.0.0",
  "description": "Adds awesome features to Talawa Admin",
  "author": "Your Name",
  "main": "index.tsx",
  "icon": "/src/assets/icon.png",
  "extensionPoints": {
    "RA1": [
      {
        "path": "/admin/my-feature",
        "component": "MyFeaturePage"
      }
    ],
    "RA2": [
      {
        "path": "/admin/my-feature/:orgId/organization",
        "component": "MyFeatureOrgPage"
      }
    ],
    "RU1": [
      {
        "path": "/user/my-feature/:orgId/user",
        "component": "MyFeatureUserOrgPage"
      }
    ],
    "RU2": [
      {
        "path": "/user/my-feature/global",
        "component": "MyFeatureUserGlobalPage"
      }
    ],
    "DA1": [
      {
        "label": "My Feature",
        "icon": "/src/assets/icon.png",
        "path": "/admin/my-feature",
        "order": 1
      }
    ],
    "DA2": [
      {
        "label": "My Feature Org",
        "icon": "/src/assets/icon.png",
        "path": "/admin/my-feature/:orgId/organization",
        "order": 2
      }
    ],
    "DU1": [
      {
        "label": "User Feature Org",
        "icon": "/src/assets/icon.png",
        "path": "/user/my-feature/:orgId/user",
        "order": 3
      }
    ],
    "DU2": [
      {
        "label": "User Feature Global",
        "icon": "/src/assets/icon.png",
        "path": "/user/my-feature/global",
        "order": 4
      }
    ],
    "G1": [
      {
        "injector": "MapIconInjector",
        "description": "Map icon indicator showing G1 extension point availability"
      }
    ]
  }
}
```

### Manifest Fields

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `name` | string | ✅ | Human-readable plugin name |
| `pluginId` | string | ✅ | Unique identifier (lowercase, underscores) |
| `version` | string | ✅ | Semantic version (e.g., 1.0.0) |
| `description` | string | ✅ | What the plugin does |
| `author` | string | ✅ | Plugin creator |
| `main` | string | ✅ | Entry point file (usually index.tsx) |
| `icon` | string | ❌ | Path to plugin icon |
| `homepage` | string | ❌ | Plugin website or documentation URL |
| `license` | string | ❌ | License type (e.g., MIT) |
| `extensionPoints` | object | ❌ | Where plugin extends the UI |

## Extension Points

Admin plugins can extend the dashboard at multiple locations:

### Route Extensions

Add new pages to the application:

- **RA1**: Routes for Admin - Global context
- **RA2**: Routes for Admin - Organization context
- **RU1**: Routes for User - Organization context
- **RU2**: Routes for User - Global context

### Drawer Extensions

Add menu items to the sidebar:

- **DA1**: Drawer items for Admin - Global
- **DA2**: Drawer items for Admin - Organization
- **DU1**: Drawer items for User - Organization
- **DU2**: Drawer items for User - Global

### Injector Extensions

Inject components at specific UI locations:

- **G1-G5**: General injection points throughout the UI

## Plugin Lifecycle

Plugins have lifecycle hooks you can implement:

```typescript
import { IPluginLifecycle } from '../../types';

const MyPluginLifecycle: IPluginLifecycle = {
  // Called when plugin is installed
  onInstall: async () => {
    console.log('Plugin installed');
  },

  // Called when plugin is activated
  onActivate: async () => {
    console.log('Plugin activated');
    // Initialize services, fetch initial data
  },

  // Called when plugin is deactivated
  onDeactivate: async () => {
    console.log('Plugin deactivated');
    // Cleanup, cancel subscriptions
  },

  // Called when plugin is uninstalled
  onUninstall: async () => {
    console.log('Plugin uninstalled');
    // Final cleanup
  },

  // Called when plugin is updated
  onUpdate: async (fromVersion, toVersion) => {
    console.log(`Updated from ${fromVersion} to ${toVersion}`);
    // Handle migration if needed
  },
};

export default MyPluginLifecycle;
```

## Quick Start Example

Here's a minimal plugin that adds a custom page:

### 1. Create manifest.json

```json
{
  "name": "Hello Plugin",
  "pluginId": "hello_plugin",
  "version": "1.0.0",
  "description": "My first Talawa plugin",
  "author": "Developer Name",
  "main": "index.tsx",
  "extensionPoints": {
    "RA1": [
      {
        "path": "/admin/hello",
        "component": "HelloPage"
      }
    ],
    "DA1": [
      {
        "label": "Hello World",
        "icon": "/src/assets/svgs/plugins.svg",
        "path": "/admin/hello",
        "order": 1
      }
    ]
  }
}
```

### 2. Create index.tsx

```typescript
import React from 'react';
import { IPluginLifecycle } from '../../types';

// Hello Page Component
export function HelloPage() {
  return (
    <div>
      <h1>Hello from my plugin!</h1>
      <p>This is my first Talawa Admin plugin.</p>
    </div>
  );
}

// Lifecycle hooks
const HelloPluginLifecycle: IPluginLifecycle = {
  onActivate: async () => {
    console.log('Hello Plugin activated!');
  },
  onDeactivate: async () => {
    console.log('Hello Plugin deactivated!');
  },
};

export default HelloPluginLifecycle;
```

### 3. Test Your Plugin


#### Development & Testing Workflow

1. **Develop your plugin in the `available` folder** (e.g., `src/plugin/available/hello_plugin/`).
2. **Use GraphiQL** to create a plugin entry in the database. For example:

   ```graphql
   mutation CreatePlugin {
     createPlugin(input: {
       pluginId: "hello_plugin"
     }) {
       id
       pluginId
       isActivated
       isInstalled
       backup
     }
   }
   ```
3. **Run the admin dashboard**:
  ```bash
  npm run serve
  ```
4. **Navigate to the Plugin Store** (`/pluginstore`) in the admin dashboard to install and activate your plugin.
5. **Access your plugin features** via the route you registered (e.g., `/admin/hello`).
6. **Once development is complete**, push your plugin to the `talawa-plugin` repository, where scripts are available to package plugins as ZIPs for direct upload and distribution.

## Development Workflow

1. **Create**: Set up plugin structure and files
2. **Develop**: Build components and features
3. **Test**: Write and run tests
4. **Package**: Create plugin ZIP
5. **Distribute**: Upload to plugin repository

## Best Practices

### Do's

- **Use TypeScript**: Type safety prevents bugs
- **Follow React conventions**: Hooks, functional components
- **Handle errors gracefully**: Try-catch blocks, error boundaries
- **Write tests**: Unit and integration tests
- **Document your code**: Comments and README
- **Use meaningful names**: Clear component and function names
- **Keep it modular**: Small, reusable components

### Don'ts

- **Don't modify core files**: Plugins should be self-contained
- **Don't hardcode values**: Use configuration and props
- **Don't skip error handling**: Always handle failures
- **Don't ignore accessibility**: Use semantic HTML and ARIA
- **Don't forget cleanup**: Remove listeners, cancel requests
- **Don't block the UI**: Use async operations properly

## Next Steps

Ready to build your plugin? Continue with:

1. **[Development](./development)**: Step-by-step development guide
2. **[Testing](https://docs-admin.talawa.io/docs/developer-resources/testing)**: How to test your plugins

## Resources

- [React Documentation](https://react.dev)
- [Material-UI](https://mui.com)
- [Apollo Client](https://www.apollographql.com/docs/react/)
- [Vite](https://vitejs.dev)
- [Vitest](https://vitest.dev)

## Need Help?

- [Community Forum](https://community.talawa.io)
- [GitHub Issues](https://github.com/PalisadoesFoundation/talawa-admin/issues)
- Developer Support: dev@talawa.io
