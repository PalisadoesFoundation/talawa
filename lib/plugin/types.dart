import 'package:flutter/widgets.dart';

/// Basic plugin manifest metadata
class PluginManifest {
  const PluginManifest({
    required this.id,
    required this.name,
    this.description,
  });

  final String id;
  final String name;
  final String? description;
}

/// A route contributed by a plugin
class PluginRoute {
  const PluginRoute({required this.routeName, required this.builder});

  final String routeName;
  final WidgetBuilder builder;
}

/// A simple menu item contribution for Menu page
class PluginMenuItem {
  const PluginMenuItem({
    required this.title,
    this.subtitle,
    required this.icon,
    required this.routeName,
  });

  final String title;
  final String? subtitle;
  final IconData icon;
  final String routeName;
}

/// Injector extension - allows plugins to inject widgets at specific locations
class PluginInjectorExtension {
  const PluginInjectorExtension({
    required this.pluginId,
    required this.name,
    this.description,
    required this.builder,
    this.order = 0,
  });

  final String pluginId;
  final String name;
  final String? description;
  final Widget Function(BuildContext context, {Map<String, dynamic>? data})
      builder;
  final int order;
}

/// Injector types - locations where plugins can inject widgets
/// G1 - General injector for menu page (under Plugins section)
/// G2 - Post content injector (under post caption)
enum InjectorType {
  g1, // Menu page - under Plugins section
  g2, // Post content - under post caption
}

/// Plugin extension points
class PluginExtensions {
  const PluginExtensions({
    this.g1 = const [],
    this.g2 = const [],
  });

  final List<PluginInjectorExtension>
      g1; // Menu page injectors (under Plugins section)
  final List<PluginInjectorExtension>
      g2; // Post content injectors (under post caption)
}

/// Public API a plugin should implement to register itself
abstract class TalawaMobilePlugin {
  PluginManifest get manifest;

  /// Return routes this plugin exposes
  List<PluginRoute> getRoutes();

  /// Return menu items to inject into the Menu page
  List<PluginMenuItem> getMenuItems(BuildContext context);

  /// Return extension points (injectors) for this plugin
  PluginExtensions getExtensions();
}
