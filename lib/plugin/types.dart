import 'package:flutter/widgets.dart';

/// Basic plugin manifest metadata.
class PluginManifest {
  const PluginManifest({
    required this.id,
    required this.name,
    this.description,
  });

  /// Unique plugin identifier.
  final String id;

  /// Human-readable name.
  final String name;

  /// Optional description.
  final String? description;
}

/// A route contributed by a plugin.
class PluginRoute {
  const PluginRoute({required this.routeName, required this.builder});

  /// Route name string.
  final String routeName;

  /// Widget builder for the route.
  final WidgetBuilder builder;
}

/// A simple menu item contribution for Menu page.
class PluginMenuItem {
  const PluginMenuItem({
    required this.title,
    this.subtitle,
    required this.icon,
    required this.routeName,
  });

  /// Title text.
  final String title;

  /// Optional subtitle text.
  final String? subtitle;

  /// Icon to display.
  final IconData icon;

  /// Route name to navigate to.
  final String routeName;
}

/// Injector extension for injecting widgets at specific locations.
class PluginInjectorExtension {
  const PluginInjectorExtension({
    required this.pluginId,
    required this.name,
    this.description,
    required this.builder,
    this.order = 0,
  });

  /// Owning plugin ID.
  final String pluginId;

  /// Extension name.
  final String name;

  /// Optional description.
  final String? description;

  /// Build function with optional data.
  final Widget Function(BuildContext context, {Map<String, dynamic>? data})
      builder;

  /// Ordering within a location (ascending).
  final int order;
}

/// Injector types - locations where plugins can inject widgets.
///
/// G1 - General injector for menu page (under Plugins section).
/// G2 - Post content injector (under post caption).
enum InjectorType {
  /// Menu page - under Plugins section.
  g1,

  /// Post content - under post caption.
  g2,
}

/// Plugin extension points.
class PluginExtensions {
  const PluginExtensions({
    this.g1 = const [],
    this.g2 = const [],
  });

  /// Menu page injectors (under Plugins section).
  final List<PluginInjectorExtension>
      g1; // Menu page injectors (under Plugins section)
  /// Post content injectors (under post caption).
  final List<PluginInjectorExtension>
      g2; // Post content injectors (under post caption)
}

/// Public API a plugin should implement to register itself.
abstract class TalawaMobilePlugin {
  /// Plugin metadata.
  PluginManifest get manifest;

  /// Returns routes this plugin exposes.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `List<PluginRoute>`: Plugin routes
  List<PluginRoute> getRoutes();

  /// Returns menu items to inject into the Menu page.
  ///
  /// **params**:
  /// * `context`: Build context
  ///
  /// **returns**:
  /// * `List<PluginMenuItem>`: Menu entries
  List<PluginMenuItem> getMenuItems(BuildContext context);

  /// Returns extension points (injectors) for this plugin.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `PluginExtensions`: Declared injectors
  PluginExtensions getExtensions();
}
