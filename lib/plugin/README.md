# Talawa Mobile Plugin System Architecture

## Overview

The Talawa Mobile Plugin System is a lightweight, Flutter-based plugin architecture designed for extending the mobile app without modifying core code. It provides a simple yet powerful system for adding custom screens, menu items, and injecting widgets at specific locations throughout the app.

### Key Features

- **Bundled Plugins**: Pre-compiled plugins bundled with the app (no dynamic loading)
- **Route Extensions**: Custom screens and navigation routes
- **Menu Item Injections**: Add items to the app menu
- **Widget Injectors**: Inject custom widgets at specific UI locations
- **Dependency Management**: Automatic Flutter/Dart package dependency installation
- **Database-Driven Activation**: Only load plugins marked as active in the database
- **Type-Safe**: Full Dart type safety with strong typing
- **Minimal Overhead**: Lightweight in-memory registry with no file I/O at runtime

---

## Architecture Overview

```
┌─────────────────────────────────────────────────────────────┐
│                    Plugin Manager                            │
│  ┌──────────────┐         ┌──────────────────┐             │
│  │   Registry   │────────▶│  Bundled Plugins │             │
│  │  (In-Memory) │         │   (Available)    │             │
│  └──────────────┘         └──────────────────┘             │
└─────────────────────────────────────────────────────────────┘
                            │
        ┌───────────────────┼───────────────────┐
        │                   │                   │
┌───────▼────────┐  ┌──────▼──────┐  ┌────────▼─────────┐
│    Routes      │  │  Menu Items │  │    Injectors     │
│  Extensions    │  │  Extensions │  │   (G1, G2)       │
├────────────────┤  ├─────────────┤  ├──────────────────┤
│ • Custom       │  │ • Title     │  │ • G1: Menu page  │
│   Screens      │  │ • Icon      │  │ • G2: Post       │
│ • Navigation   │  │ • Route     │  │   content        │
│                │  │             │  │                  │
└────────────────┘  └─────────────┘  └──────────────────┘
```

---

## Core Concepts

### Bundled vs Dynamic

**Talawa Mobile uses a bundled plugin approach:**
- Plugins are compiled into the app at build time
- No runtime code loading or dynamic imports
- Plugins live in `lib/plugin/available/`
- Each plugin is a Dart package imported statically
- Database determines which bundled plugins are active

**Why Bundled?**
- ✅ Better performance (no dynamic loading overhead)
- ✅ Simpler security model (no code injection risks)
- ✅ Type safety (compile-time checking)
- ✅ App store compliance (no dynamic code execution)
- ✅ Easier to test and debug

### Database as Source of Truth

The plugin activation state is managed in the backend database:
```dart
// Only plugins marked as active in DB are loaded
PluginManager.instance.initialize(
  getBundledPlugins(),
  active: ['plugin_map', 'razorpay', 'summarize_t5']
);
```

---

## Core Files

### 1. `index.dart` - Main Entry Point

**Purpose**: Central export hub for the plugin system.

**Responsibilities**:
- Exports all plugin types and APIs
- Provides helper functions for common operations
- Single import point for plugin consumers

**Key Exports**:
```dart
export 'types.dart';
export 'registry.dart';
export 'manager.dart';
export 'plugin_injector.dart';
```

**Helper Functions**:

**`buildPluginRoutes()`** - Build route map for Navigator:
```dart
Map<String, WidgetBuilder> buildPluginRoutes() {
  final routes = <String, WidgetBuilder>{};
  for (final r in PluginManager.instance.routes) {
    routes[r.routeName] = r.builder;
  }
  return routes;
}
```

**Usage**:
```dart
import 'package:talawa/plugin/index.dart';

// In MaterialApp
MaterialApp(
  routes: {
    ...appRoutes,
    ...buildPluginRoutes(), // Add plugin routes
  },
);
```

---

### 2. `types.dart` - Type Definitions

**Purpose**: Defines all core types and interfaces for the plugin system.

**Key Types**:

#### `PluginManifest` - Plugin Metadata
```dart
class PluginManifest {
  final String id;              // Unique plugin identifier
  final String name;            // Display name
  final String? description;    // Optional description

  const PluginManifest({
    required this.id,
    required this.name,
    this.description,
  });
}
```

#### `PluginRoute` - Route Extension
```dart
class PluginRoute {
  final String routeName;        // Route path (e.g., '/plugin/map')
  final WidgetBuilder builder;   // Widget builder function

  const PluginRoute({
    required this.routeName,
    required this.builder,
  });
}
```

**Usage**:
```dart
PluginRoute(
  routeName: '/plugin/map',
  builder: (context) => MapScreen(),
)
```

#### `PluginMenuItem` - Menu Extension
```dart
class PluginMenuItem {
  final String title;            // Menu item title
  final String? subtitle;        // Optional subtitle
  final IconData icon;          // Material icon
  final String routeName;       // Route to navigate to

  const PluginMenuItem({
    required this.title,
    this.subtitle,
    required this.icon,
    required this.routeName,
  });
}
```

**Usage**:
```dart
PluginMenuItem(
  title: 'Map View',
  subtitle: 'View events on map',
  icon: Icons.map,
  routeName: '/plugin/map',
)
```

#### `PluginInjectorExtension` - Widget Injector
```dart
class PluginInjectorExtension {
  final String pluginId;          // Plugin identifier
  final String name;              // Injector name
  final String? description;      // Optional description
  final Widget Function(
    BuildContext context,
    {Map<String, dynamic>? data}
  ) builder;                      // Widget builder
  final int order;                // Display order (0 = first)

  const PluginInjectorExtension({
    required this.pluginId,
    required this.name,
    this.description,
    required this.builder,
    this.order = 0,
  });
}
```

**Usage**:
```dart
PluginInjectorExtension(
  pluginId: 'summarize_t5',
  name: 'Post Summary',
  builder: (context, {data}) => 
    SummaryWidget(postContent: data?['content']),
  order: 1,
)
```

#### `InjectorType` - Injection Points
```dart
enum InjectorType {
  G1,  // Menu page - under Plugins section
  G2,  // Post content - under post caption
}
```

**Injection Points**:
- **G1**: Menu page plugin section - Add custom menu items/widgets
- **G2**: Post content area - Add features below post captions (e.g., AI summaries)

#### `PluginExtensions` - Extension Container
```dart
class PluginExtensions {
  final List<PluginInjectorExtension> G1;  // Menu page injectors
  final List<PluginInjectorExtension> G2;  // Post content injectors

  const PluginExtensions({
    this.G1 = const [],
    this.G2 = const [],
  });
}
```

#### `TalawaMobilePlugin` - Plugin Interface
```dart
abstract class TalawaMobilePlugin {
  // Plugin metadata
  PluginManifest get manifest;

  // Return routes this plugin exposes
  List<PluginRoute> getRoutes();

  // Return menu items to inject into the Menu page
  List<PluginMenuItem> getMenuItems(BuildContext context);

  // Return extension points (injectors) for this plugin
  PluginExtensions getExtensions();
}
```

---

### 3. `manager.dart` - Plugin Manager

**Purpose**: Main coordination layer that wires the registry with bundled plugins.

**Key Responsibilities**:

1. **Plugin Initialization**
   - Loads bundled plugins from `available/` directory
   - Filters by activation status from database
   - Registers active plugins with registry

2. **Singleton Management**
   - Provides global access via `PluginManager.instance`
   - Ensures single initialization

3. **Extension Point Access**
   - Routes collection
   - Menu items collection
   - Injector collection by type

**Singleton Pattern**:
```dart
class PluginManager {
  // Global singleton instance
  static final PluginManager instance = PluginManager(PluginRegistry());
  
  // Private flag to prevent re-initialization
  bool _initialized = false;
}
```

**Key Methods**:

**`initialize(available, {active})`** - Initialize plugin system:
```dart
void initialize(
  List<TalawaMobilePlugin> available,  // All bundled plugins
  {List<String>? active}                // Active plugin IDs from DB
) {
  if (_initialized) return;
  
  // Filter bundled plugins by activation status
  final filtered = available.where(
    (p) => active?.contains(p.manifest.id) ?? false
  ).toList();
  
  registry.registerAll(filtered);
  _initialized = true;
}
```

**How It Works**:
1. Receives list of all bundled plugins
2. Receives list of active plugin IDs from database
3. Filters bundled plugins to only active ones
4. Registers filtered plugins with registry
5. Logs detailed information about registration process

**`reset()`** - Reset for testing:
```dart
void reset() {
  registry.clear();
  _initialized = false;
}
```

**`get routes`** - Get all plugin routes:
```dart
List<PluginRoute> get routes => registry.collectRoutes();
```

**`getMenuItems(context)`** - Get all menu items:
```dart
List<PluginMenuItem> getMenuItems(BuildContext context) =>
    registry.collectMenuItems(context);
```

**`getInjectors(type)`** - Get injectors for specific type:
```dart
List<PluginInjectorExtension> getInjectors(InjectorType type) =>
    registry.collectInjectors(type);
```

**`get isInitialized`** - Check initialization status:
```dart
bool get isInitialized => _initialized;
```

---

### 4. `registry.dart` - Plugin Registry

**Purpose**: Lightweight in-memory registry for activated plugins.

**Key Responsibilities**:

1. **Plugin Storage**
   - In-memory Map of plugin ID → plugin instance
   - No file I/O or database operations

2. **Plugin Registration**
   - Single plugin registration
   - Bulk registration

3. **Extension Collection**
   - Collect routes from all plugins
   - Collect menu items from all plugins
   - Collect injectors by type

**Data Structure**:
```dart
class PluginRegistry {
  final Map<String, TalawaMobilePlugin> _plugins = {};
}
```

**Key Methods**:

**`register(plugin)`** - Register single plugin:
```dart
void register(TalawaMobilePlugin plugin) {
  _plugins[plugin.manifest.id] = plugin;
}
```

**`registerAll(plugins)`** - Register multiple plugins:
```dart
void registerAll(Iterable<TalawaMobilePlugin> plugins) {
  for (final p in plugins) {
    register(p);
  }
}
```

**`clear()`** - Clear all plugins:
```dart
void clear() {
  _plugins.clear();
}
```

**`get all`** - Get all registered plugins:
```dart
List<TalawaMobilePlugin> get all => 
    _plugins.values.toList(growable: false);
```

**`collectRoutes()`** - Collect all routes:
```dart
List<PluginRoute> collectRoutes() {
  return all.expand((p) => p.getRoutes()).toList(growable: false);
}
```

**`collectMenuItems(context)`** - Collect all menu items:
```dart
List<PluginMenuItem> collectMenuItems(BuildContext context) {
  return all
      .expand((p) => p.getMenuItems(context))
      .toList(growable: false);
}
```

**`collectInjectors(type)`** - Collect injectors by type:
```dart
List<PluginInjectorExtension> collectInjectors(InjectorType type) {
  final injectors = <PluginInjectorExtension>[];
  for (final plugin in all) {
    final extensions = plugin.getExtensions();
    switch (type) {
      case InjectorType.G1:
        injectors.addAll(extensions.G1);
        break;
      case InjectorType.G2:
        injectors.addAll(extensions.G2);
        break;
    }
  }
  // Sort by order
  injectors.sort((a, b) => a.order.compareTo(b.order));
  return injectors;
}
```

---

### 5. `plugin_injector.dart` - Widget Injector Component

**Purpose**: Flutter widget that renders plugin-injected widgets at specific locations.

**Key Features**:

1. **Location-Specific Rendering**
   - Supports multiple injection types (G1, G2)
   - Renders all injectors for specified type
   - Sorts by order property

2. **Data Passing**
   - Pass contextual data to injected widgets
   - Type-safe data map

3. **Error Handling**
   - Graceful fallback on errors
   - No UI breakage from plugin failures

**Usage**:
```dart
// In menu screen
PluginInjector(
  injectorType: InjectorType.G1,
  padding: EdgeInsets.all(8),
)

// In post widget
PluginInjector(
  injectorType: InjectorType.G2,
  data: {
    'postId': post.id,
    'content': post.content,
    'author': post.author,
  },
)
```

**Widget Structure**:
```dart
class PluginInjector extends StatelessWidget {
  final InjectorType injectorType;       // Which injection point
  final Map<String, dynamic>? data;      // Data to pass to injectors
  final EdgeInsetsGeometry? padding;     // Padding between injectors
  
  @override
  Widget build(BuildContext context) {
    // Check if system initialized
    if (!PluginManager.instance.isInitialized) {
      return const SizedBox.shrink();
    }
    
    // Get injectors for this type
    final injectors = PluginManager.instance.getInjectors(injectorType);
    
    if (injectors.isEmpty) {
      return const SizedBox.shrink();
    }
    
    // Render all injectors in a column
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: injectors.map((injector) {
        return Padding(
          padding: padding ?? const EdgeInsets.symmetric(vertical: 4.0),
          child: _buildInjectorWidget(context, injector),
        );
      }).toList(),
    );
  }
}
```

**Error Handling**:
```dart
Widget _buildInjectorWidget(
  BuildContext context,
  PluginInjectorExtension injector
) {
  try {
    return injector.builder(context, data: data);
  } catch (e) {
    print('Error rendering plugin injector "${injector.name}": $e');
    return const SizedBox.shrink();
  }
}
```

---

### 6. `available/index.dart` - Bundled Plugins Registry

**Purpose**: Central registry of all bundled plugins in the app.

**How It Works**:
```dart
import 'package:talawa/plugin/types.dart';
import 'package:talawa/plugin/available/plugin_map/index.dart';
import 'package:talawa/plugin/available/razorpay/index.dart';
import 'package:talawa/plugin/available/summarize_t5/index.dart';

/// Pre-bundled plugins in the mobile app
List<TalawaMobilePlugin> getBundledPlugins() => [
  PluginMapAppPlugin(),
  RazorpayPlugin(),
  SummarizeT5Plugin(),
];
```

**Usage in App**:
```dart
import 'package:talawa/plugin/available/index.dart';

// During app initialization
final activePluginIds = await fetchActivePluginsFromDatabase();
PluginManager.instance.initialize(
  getBundledPlugins(),
  active: activePluginIds,
);
```

---

## Dependency Management

### 7. `scripts/install_plugin_dependencies.py` - Dependency Installer

**Purpose**: Automatically installs Flutter/Dart packages required by plugins.

**How It Works**:

1. **Scan Plugins**
   - Scans `lib/plugin/available/*/plugin.yaml` files
   - Each plugin declares dependencies in YAML

2. **Collect Dependencies**
   - Aggregates all plugin dependencies
   - Handles version conflicts

3. **Update pubspec.yaml**
   - Adds dependencies with comments indicating source plugin
   - Preserves existing dependencies

4. **Example**:

**Plugin declares** (`lib/plugin/available/razorpay/plugin.yaml`):
```yaml
dependencies:
  razorpay_flutter: ^1.3.7
  http: ^1.0.0
```

**Script adds to `pubspec.yaml`**:
```yaml
dependencies:
  razorpay_flutter: ^1.3.7  # Added by plugin: razorpay
  http: ^1.0.0              # Added by plugin: razorpay
```

**Usage**:
```bash
# Install all plugin dependencies
python3 lib/plugin/scripts/install_plugin_dependencies.py

# Then get Flutter packages
flutter pub get
```

**CI/CD Integration**:
```yaml
# .github/workflows/build.yml
- name: Install plugin dependencies
  run: python3 lib/plugin/scripts/install_plugin_dependencies.py

- name: Get Flutter dependencies
  run: flutter pub get
```

**Features**:
- ✅ Automatic dependency resolution
- ✅ Version conflict detection
- ✅ Colored terminal output
- ✅ Detailed logging
- ✅ Error handling
- ✅ Idempotent (safe to run multiple times)

---

## Plugin Development Workflow

### 1. Plugin Structure

```
lib/plugin/available/my_plugin/
├── plugin.yaml           # Plugin metadata and dependencies
├── index.dart           # Main plugin class
├── screens/
│   └── my_screen.dart  # Custom screens
├── widgets/
│   └── my_widget.dart  # Custom widgets
└── services/
    └── api_service.dart # Business logic
```

### 2. Plugin Manifest (`plugin.yaml`)

```yaml
id: my_plugin
name: My Awesome Plugin
description: Adds cool features to Talawa
version: 1.0.0
author: Your Name

dependencies:
  http: ^1.0.0
  provider: ^6.0.0
```

### 3. Plugin Implementation

```dart
// index.dart
import 'package:flutter/material.dart';
import 'package:talawa/plugin/types.dart';
import 'screens/my_screen.dart';
import 'widgets/summary_widget.dart';

class MyAwesomePlugin extends TalawaMobilePlugin {
  @override
  PluginManifest get manifest => const PluginManifest(
    id: 'my_plugin',
    name: 'My Awesome Plugin',
    description: 'Adds cool features',
  );

  @override
  List<PluginRoute> getRoutes() {
    return [
      PluginRoute(
        routeName: '/plugin/my_screen',
        builder: (context) => const MyCustomScreen(),
      ),
    ];
  }

  @override
  List<PluginMenuItem> getMenuItems(BuildContext context) {
    return [
      PluginMenuItem(
        title: 'My Feature',
        subtitle: 'Access my awesome feature',
        icon: Icons.star,
        routeName: '/plugin/my_screen',
      ),
    ];
  }

  @override
  PluginExtensions getExtensions() {
    return PluginExtensions(
      G1: [
        // Menu page injector
        PluginInjectorExtension(
          pluginId: 'my_plugin',
          name: 'Quick Action',
          builder: (context, {data}) => 
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(
                context,
                '/plugin/my_screen'
              ),
              child: Text('Quick Action'),
            ),
          order: 1,
        ),
      ],
      G2: [
        // Post content injector
        PluginInjectorExtension(
          pluginId: 'my_plugin',
          name: 'Post Enhancement',
          builder: (context, {data}) => 
            SummaryWidget(content: data?['content']),
          order: 2,
        ),
      ],
    );
  }
}
```

### 4. Register Plugin

Add to `lib/plugin/available/index.dart`:
```dart
import 'package:talawa/plugin/available/my_plugin/index.dart';

List<TalawaMobilePlugin> getBundledPlugins() => [
  // ... existing plugins
  MyAwesomePlugin(),
];
```

### 5. Install Dependencies

```bash
python3 lib/plugin/scripts/install_plugin_dependencies.py
flutter pub get
```

### 6. Build and Run

```bash
flutter build apk
# or
flutter run
```

---

## Integration Points

### App Initialization

```dart
// In main.dart or app initialization
import 'package:talawa/plugin/index.dart';
import 'package:talawa/plugin/available/index.dart';

Future<void> initializeApp() async {
  // Fetch active plugins from backend
  final activePlugins = await graphQLService.getActivePlugins();
  
  // Initialize plugin system
  PluginManager.instance.initialize(
    getBundledPlugins(),
    active: activePlugins,
  );
}
```

### Route Registration

```dart
// In MaterialApp
import 'package:talawa/plugin/index.dart';

MaterialApp(
  routes: {
    '/': (context) => HomeScreen(),
    '/menu': (context) => MenuScreen(),
    // Add plugin routes
    ...buildPluginRoutes(),
  },
)
```

### Menu Page Integration

```dart
// In menu screen
import 'package:talawa/plugin/index.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pluginMenuItems = PluginManager.instance.getMenuItems(context);
    
    return ListView(
      children: [
        // Regular menu items
        ...regularMenuItems,
        
        // Plugin section
        if (pluginMenuItems.isNotEmpty) ...[
          Divider(),
          ListTile(
            title: Text('Plugins', 
              style: TextStyle(fontWeight: FontWeight.bold)
            ),
          ),
          // Render plugin menu items
          ...pluginMenuItems.map((item) => ListTile(
            leading: Icon(item.icon),
            title: Text(item.title),
            subtitle: item.subtitle != null ? Text(item.subtitle!) : null,
            onTap: () => Navigator.pushNamed(context, item.routeName),
          )),
        ],
        
        // Plugin injectors (G1)
        PluginInjector(injectorType: InjectorType.G1),
      ],
    );
  }
}
```

### Post Content Integration

```dart
// In post widget
import 'package:talawa/plugin/index.dart';

class PostCard extends StatelessWidget {
  final Post post;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          // Post header
          PostHeader(post: post),
          
          // Post content
          PostContent(post: post),
          
          // Plugin injectors (G2) - inject below post content
          PluginInjector(
            injectorType: InjectorType.G2,
            data: {
              'postId': post.id,
              'content': post.content,
              'author': post.author,
              'likes': post.likes,
            },
          ),
          
          // Post actions
          PostActions(post: post),
        ],
      ),
    );
  }
}
```

---

## Best Practices

### For Plugin Developers

1. **Keep It Lightweight** - Mobile apps need to be performant
2. **Handle Errors Gracefully** - Don't crash the host app
3. **Use Async Wisely** - Don't block the UI thread
4. **Follow Material Design** - Consistent with app UI
5. **Test Thoroughly** - Test on different devices and screen sizes
6. **Declare Dependencies** - Always use `plugin.yaml` for packages
7. **Document Well** - Add comments and documentation

### For System Integrators

1. **Initialize Early** - Before building UI
2. **Handle Loading States** - Show loading indicators during initialization
3. **Check Initialization** - Use `isInitialized` before accessing plugins
4. **Error Boundaries** - Wrap plugin widgets in error handlers
5. **Test Plugin Combinations** - Test with different plugin combinations active

### For Administrators

1. **Database Control** - Manage plugin activation via backend
2. **Test Before Bundling** - Validate plugins before including in build
3. **Monitor Dependencies** - Keep plugin dependencies up to date
4. **Version Compatibility** - Ensure plugins work with current app version
5. **Security Review** - Review plugin code for security issues

---

## Injector System

### Available Injection Points

#### G1 - Menu Page Injectors
**Location**: Menu screen, under "Plugins" section

**Use Cases**:
- Quick action buttons
- Custom menu items
- Shortcut widgets
- Information cards

**Example**:
```dart
PluginInjectorExtension(
  pluginId: 'my_plugin',
  name: 'Quick Access',
  builder: (context, {data}) => Card(
    child: ListTile(
      leading: Icon(Icons.flash_on),
      title: Text('Quick Action'),
      onTap: () => performQuickAction(),
    ),
  ),
)
```

#### G2 - Post Content Injectors
**Location**: Post cards, below post caption/content

**Use Cases**:
- AI-powered summaries
- Sentiment analysis
- Translation widgets
- Related content suggestions
- Custom reactions

**Example**:
```dart
PluginInjectorExtension(
  pluginId: 'summarize_t5',
  name: 'AI Summary',
  builder: (context, {data}) {
    final content = data?['content'] as String?;
    if (content == null || content.length < 100) {
      return SizedBox.shrink();
    }
    return SummaryWidget(content: content);
  },
  order: 1,
)
```

---

## Testing

### Unit Tests

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/plugin/index.dart';

void main() {
  group('Plugin Registry', () {
    late PluginRegistry registry;
    
    setUp(() {
      registry = PluginRegistry();
    });
    
    test('registers plugin', () {
      final plugin = TestPlugin();
      registry.register(plugin);
      expect(registry.all.length, 1);
    });
    
    test('collects routes', () {
      final plugin = TestPlugin();
      registry.register(plugin);
      final routes = registry.collectRoutes();
      expect(routes.length, greaterThan(0));
    });
  });
}
```

### Widget Tests

```dart
testWidgets('PluginInjector renders widgets', (tester) async {
  // Initialize plugin manager
  PluginManager.instance.initialize(
    [TestPlugin()],
    active: ['test_plugin'],
  );
  
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: PluginInjector(
          injectorType: InjectorType.G1,
        ),
      ),
    ),
  );
  
  expect(find.byType(PluginInjector), findsOneWidget);
});
```

---

## Troubleshooting

### Plugin Not Appearing

**Symptoms**: Plugin doesn't show up in menu or routes

**Solutions**:
1. Check plugin is in `getBundledPlugins()` list
2. Verify plugin ID is in active list from database
3. Check initialization logs for filtering details
4. Ensure `getRoutes()` and `getMenuItems()` return non-empty lists
5. Verify `PluginManager.instance.initialize()` was called

### Injector Not Rendering

**Symptoms**: Widget injector doesn't appear

**Solutions**:
1. Check plugin is active and registered
2. Verify `getExtensions()` returns injectors for correct type (G1/G2)
3. Check `PluginInjector` is placed in UI at desired location
4. Look for errors in builder function
5. Verify `isInitialized` is true before rendering

### Dependency Conflicts

**Symptoms**: Build fails due to dependency version conflicts

**Solutions**:
1. Check multiple plugins aren't requiring conflicting versions
2. Update plugin `plugin.yaml` with compatible versions
3. Run dependency installer script again
4. Manually resolve in `pubspec.yaml`
5. Use `flutter pub outdated` to check version compatibility

### Routes Not Working

**Symptoms**: Navigation fails or shows error screen

**Solutions**:
1. Verify route name format (should start with `/`)
2. Check `buildPluginRoutes()` is added to MaterialApp routes
3. Ensure builder function returns valid Widget
4. Check for typos in route names
5. Verify context has Navigator

---

## Future Enhancements

- **Plugin Configuration UI**: Settings screen for plugins
- **Plugin Marketplace**: Browse and discover plugins
- **Hot Reload Support**: Update plugins without rebuild
- **Permission System**: Fine-grained plugin permissions
- **Plugin Analytics**: Track plugin usage and performance
- **More Injection Points**: Additional UI locations for injection
- **Plugin Communication**: Inter-plugin messaging
- **Theming Support**: Plugin-specific themes

---

## Contributing

When extending the plugin system:

1. Follow Flutter/Dart best practices
2. Add tests for new features
3. Update type definitions
4. Document new injection points
5. Maintain backward compatibility
6. Consider mobile performance

---

## License

See main project LICENSE file.
