import 'package:flutter/widgets.dart';

/// Basic plugin manifest metadata
class PluginManifest {
  final String id;
  final String name;
  final String? description;

  const PluginManifest({
    required this.id,
    required this.name,
    this.description,
  });
}

/// A route contributed by a plugin
class PluginRoute {
  final String routeName;
  final WidgetBuilder builder;

  const PluginRoute({required this.routeName, required this.builder});
}

/// A simple menu item contribution for Menu page
class PluginMenuItem {
  final String title;
  final String? subtitle;
  final IconData icon;
  final String routeName;

  const PluginMenuItem({
    required this.title,
    this.subtitle,
    required this.icon,
    required this.routeName,
  });
}

/// Injector extension - allows plugins to inject widgets at specific locations
class PluginInjectorExtension {
  final String pluginId;
  final String name;
  final String? description;
  final Widget Function(BuildContext context, {Map<String, dynamic>? data}) builder;
  final int order;

  const PluginInjectorExtension({
    required this.pluginId,
    required this.name,
    this.description,
    required this.builder,
    this.order = 0,
  });
}

/// Injector types - locations where plugins can inject widgets
/// G1 - General injector for menu page (under Plugins section)
/// G2 - Post content injector (under post caption)
enum InjectorType {
  G1, // Menu page - under Plugins section
  G2, // Post content - under post caption
}

/// Plugin extension points
class PluginExtensions {
  final List<PluginInjectorExtension> G1; // Menu page injectors (under Plugins section)
  final List<PluginInjectorExtension> G2; // Post content injectors (under post caption)

  const PluginExtensions({
    this.G1 = const [],
    this.G2 = const [],
  });
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
