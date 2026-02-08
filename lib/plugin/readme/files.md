## Core Files

### 1. `manager.dart` - Plugin Manager

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

### 2. `registry.dart` - Plugin Registry

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

### 3. `plugin_injector.dart` - Widget Injector Component

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

---

### 4. `available/index.dart` - Bundled Plugins Registry

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

### 5. Retry Queue Integration

**Purpose**: Plugins can access the app's `RetryQueue` service for resilient network operations with exponential backoff.

**Access Pattern**:
```dart
// Via the plugin registry
final services = registry.getAvailableServices();
final retryQueue = services['RetryQueue'] as RetryQueue;
```

**Usage Example**:
```dart
final result = await retryQueue.execute(
  () => myNetworkCall(),
  key: 'my-plugin-operation',
  customConfig: const RetryConfig(
    maxAttempts: 5,
    initialDelay: Duration(milliseconds: 500),
    maxDelay: Duration(seconds: 30),
  ),
  onRetry: (attempt, error) {
    debugPrint('Retry attempt $attempt: $error');
  },
  shouldRetry: (error) => !error.toString().contains('auth'),
);

if (result.succeeded) {
  // Use result.data
} else {
  // Handle result.error
}
```

**RetryConfig Options**:
- `maxAttempts` — Maximum number of retry attempts (default: 3)
- `initialDelay` — Initial delay before first retry (default: 300ms)
- `maxDelay` — Maximum delay between retries (default: 30s)
- `backoffMultiplier` — Multiplier for exponential backoff (default: 2.0)

---
