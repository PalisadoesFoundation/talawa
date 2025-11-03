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

