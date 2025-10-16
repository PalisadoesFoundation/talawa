import 'package:flutter/material.dart';
import 'package:talawa/plugin/manager.dart';

export 'manager.dart';
export 'plugin_injector.dart';
export 'registry.dart';
export 'types.dart';

/// Helper function to build plugin routes from the global manager instance
Map<String, WidgetBuilder> buildPluginRoutes() {
  final routes = <String, WidgetBuilder>{};
  for (final r in PluginManager.instance.routes) {
    routes[r.routeName] = r.builder;
  }
  return routes;
}
