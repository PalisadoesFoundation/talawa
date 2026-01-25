import 'package:flutter/widgets.dart';
import 'package:talawa/plugin/types.dart';

/// A very small in-memory registry for activated plugins.
///
/// **params**:
///   None
class PluginRegistry {
  /// Storage for plugins by ID.
  final Map<String, TalawaMobilePlugin> _plugins = {};

  /// Registers a single plugin.
  ///
  /// **params**:
  /// * `plugin`: Plugin to register.
  ///
  /// **returns**:
  ///   None
  void register(TalawaMobilePlugin plugin) {
    _plugins[plugin.manifest.id] = plugin;
  }

  /// Registers multiple plugins.
  ///
  /// **params**:
  /// * `plugins`: Plugins to register.
  ///
  /// **returns**:
  ///   None
  void registerAll(Iterable<TalawaMobilePlugin> plugins) {
    for (final p in plugins) {
      register(p);
    }
  }

  /// Removes all registered plugins.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void clear() {
    _plugins.clear();
  }

  /// All registered plugins.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `List<TalawaMobilePlugin>`: Unordered list.
  List<TalawaMobilePlugin> get all => _plugins.values.toList(growable: false);

  /// Collects all routes from registered plugins.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `List<PluginRoute>`: All plugin routes.
  List<PluginRoute> collectRoutes() {
    return all.expand((p) => p.getRoutes()).toList(growable: false);
  }

  /// Collects menu items from registered plugins.
  ///
  /// **params**:
  /// * `context`: Build context.
  ///
  /// **returns**:
  /// * `List<PluginMenuItem>`: Menu items for UI.
  List<PluginMenuItem> collectMenuItems(BuildContext context) {
    return all.expand((p) => p.getMenuItems(context)).toList(growable: false);
  }

  /// Collects injectors for a specific type.
  ///
  /// **params**:
  /// * `type`: Injector location/type.
  ///
  /// **returns**:
  /// * `List<PluginInjectorExtension>`: Ordered injectors.
  List<PluginInjectorExtension> collectInjectors(InjectorType type) {
    final injectors = <PluginInjectorExtension>[];
    for (final plugin in all) {
      final extensions = plugin.getExtensions();
      switch (type) {
        case InjectorType.g1:
          injectors.addAll(extensions.g1);
        case InjectorType.g2:
          injectors.addAll(extensions.g2);
      }
    }
    // Sort by order
    injectors.sort((a, b) => a.order.compareTo(b.order));
    return injectors;
  }
}
