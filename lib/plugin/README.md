# Talawa Mobile Plugin System

## Overview

A simple, non-overengineered plugin system that allows extending the Talawa mobile app with custom features.

## Architecture

### Core Components

1. **PluginRegistry** (`registry.dart`)
   - In-memory storage for registered plugins
   - Collects routes, menu items, and injectors from all active plugins

2. **PluginManager** (`manager.dart`)
   - Singleton pattern for app-wide access: `PluginManager.instance`
   - Handles plugin initialization with database-driven activation
   - Lazy initialization on first menu access

3. **Plugin Types** (`types.dart`)
   - `TalawaMobilePlugin`: Interface for all plugins
   - `PluginManifest`: Plugin metadata (id, name, description)
   - `PluginRoute`: Routes contributed by plugins
   - `PluginMenuItem`: Menu items contributed by plugins
   - `PluginInjector`: Widgets that can be injected at specific locations
   - `InjectorType`: Enum defining injection points (G1 for menu)

4. **PluginInjector Widget** (`plugin_injector.dart`)
   - Widget that renders plugin-injected content at specific locations
   - Similar to admin's PluginInjector component

## How It Works

### Initialization Flow

1. User opens the **Menu Page** for the first time
2. Menu page queries the backend GraphQL API:
   ```graphql
   query GetAllPlugins {
     getPlugins(input: {}) {
       id
       pluginId
       isActivated
       isInstalled
     }
   }
   ```
3. Filters plugins where `isActivated == true`
4. Only initializes bundled plugins that are also activated in the database
5. Plugins remain initialized for the app session

### Plugin Registration

Each plugin (e.g., `PluginMapPlugin`) implements `TalawaMobilePlugin`:

```dart
class PluginMapPlugin implements TalawaMobilePlugin {
  @override
  PluginManifest get manifest => const PluginManifest(
    id: 'plugin_map',
    name: 'Plugin Map',
    description: 'A sample plugin',
  );

  @override
  List<PluginMenuItem> getMenuItems(BuildContext context) => [
    // Menu items to inject into Menu page
  ];

  @override
  List<PluginRoute> getRoutes() => [
    // Routes that this plugin provides
  ];

  @override
  PluginExtensions getExtensions() {
    return PluginExtensions(
      G1: [
        PluginInjector(
          pluginId: manifest.id,
          name: 'My Custom Widget',
          description: 'A custom widget injected into menu',
          order: 0,
          builder: (context) => Card(
            child: ListTile(
              title: Text('Injected by Plugin!'),
              onTap: () { /* ... */ },
            ),
          ),
        ),
      ],
    );
  }
}
```

### Injector System

Plugins can inject custom widgets at specific locations using `PluginInjector`:

**Injector Types:**
- `G1`: Menu page - under Plugins section

**Usage in app:**
```dart
// In menu_page.dart
PluginInjector(
  injectorType: InjectorType.G1,
)
```

This will render all widgets that plugins have registered for the G1 injector type.

### Route Handling

- Router's `default` case checks plugin routes using `buildPluginRoutes()`
- If a route matches a plugin route, it renders the plugin's widget
- Falls back to demo page if no match found

## Adding a New Plugin

1. Create a new folder in `lib/plugin/available/my_plugin/`
2. Create `index.dart` with your plugin class implementing `TalawaMobilePlugin`
3. Implement all required methods:
   - `manifest` - Plugin metadata
   - `getMenuItems()` - Menu items (can return empty list)
   - `getRoutes()` - Plugin routes (can return empty list)
   - `getExtensions()` - Injectors (can return empty PluginExtensions)
4. Add your plugin to `getBundledPlugins()` in `lib/plugin/available/index.dart`:
   ```dart
   List<TalawaMobilePlugin> getBundledPlugins() => [
     HelloWorldPlugin(),
     PluginMapAppPlugin(),
     MyNewPlugin(), // Add here
   ];
   ```
5. Ensure the plugin's `manifest.id` matches the `pluginId` in your database

## Database Integration

The backend must provide the `getPlugins` query that returns:
- `pluginId`: Unique identifier matching `manifest.id`
- `isActivated`: Boolean flag to enable/disable plugins
- `isInstalled`: Optional flag for installed state

Only plugins with `isActivated: true` **AND** bundled in the app will be initialized.

## Benefits

- **Simple**: Single global instance, no complex dependency injection
- **Lazy**: Plugins only initialize when menu is first accessed
- **Database-driven**: Backend controls which plugins are active
- **Flexible**: Plugins can inject widgets anywhere using injector types
- **Fallback**: On error, loads all bundled plugins (graceful degradation)
- **Extensible**: Easy to add new plugins without modifying core app code

## Testing

To reset plugins during testing:
```dart
PluginManager.instance.reset();
```

This clears the registry and allows re-initialization.

## Future Expansion

To add more injector types, simply:
1. Add new enum value to `InjectorType` in `types.dart`
2. Add corresponding field to `PluginExtensions` class
3. Update `collectInjectors()` in `registry.dart`
4. Place `PluginInjector` widget where you want plugins to inject content
