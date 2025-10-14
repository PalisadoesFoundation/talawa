import 'package:flutter/widgets.dart';
import 'package:talawa/plugin/types.dart';

/// A very small in-memory registry for activated plugins
class PluginRegistry {
  final Map<String, TalawaMobilePlugin> _plugins = {};

  void register(TalawaMobilePlugin plugin) {
    _plugins[plugin.manifest.id] = plugin;
  }

  void registerAll(Iterable<TalawaMobilePlugin> plugins) {
    for (final p in plugins) {
      register(p);
    }
  }

  void clear() {
    _plugins.clear();
  }

  List<TalawaMobilePlugin> get all => _plugins.values.toList(growable: false);

  List<PluginRoute> collectRoutes() {
    return all.expand((p) => p.getRoutes()).toList(growable: false);
  }

  List<PluginMenuItem> collectMenuItems(BuildContext context) {
    return all
        .expand((p) => p.getMenuItems(context))
        .toList(growable: false);
  }

  /// Collect injectors for a specific type
  List<PluginInjectorExtension> collectInjectors(InjectorType type) {
    final injectors = <PluginInjectorExtension>[];
    for (final plugin in all) {
      final extensions = plugin.getExtensions();
      switch (type) {
        case InjectorType.G1:
          injectors.addAll(extensions.G1);
          break;
      }
    }
    // Sort by order
    injectors.sort((a, b) => a.order.compareTo(b.order));
    return injectors;
  }
}
