import 'package:flutter/material.dart';
import 'package:talawa/plugin/manager.dart';
import 'package:talawa/plugin/types.dart';

export 'types.dart';
export 'registry.dart';
export 'manager.dart';
export 'plugin_injector.dart';

/// Helper function to build plugin routes from the global manager instance
Map<String, WidgetBuilder> buildPluginRoutes() {
  final routes = <String, WidgetBuilder>{};
  for (final r in PluginManager.instance.routes) {
    routes[r.routeName] = r.builder;
  }
  return routes;
}
