// ignore_for_file: talawa_good_doc_comments
import 'package:flutter/material.dart';
import 'package:talawa/plugin/manager.dart';

export 'manager.dart';
export 'plugin_injector.dart';
export 'registry.dart';
export 'types.dart';

/// Builds plugin routes from the global [PluginManager] instance.
///
/// **params**:
///   None
///
/// **returns**:
/// * `Map<String, WidgetBuilder>`: A map of route names to their corresponding widget builders.
Map<String, WidgetBuilder> buildPluginRoutes() {
  final routes = <String, WidgetBuilder>{};
  for (final r in PluginManager.instance.routes) {
    routes[r.routeName] = r.builder;
  }
  return routes;
}
