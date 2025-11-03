import 'package:flutter/widgets.dart';
import 'package:talawa/plugin/registry.dart';
import 'package:talawa/plugin/types.dart';

/// A thin manager that wires the registry with bundled plugins.
class PluginManager {
  /// Creates a new plugin manager.
  ///
  /// **params**:
  /// * `registry`: Registry to store activated plugins.
  PluginManager(this.registry);

  /// Underlying registry instance.
  final PluginRegistry registry;
  bool _initialized = false;

  /// Global singleton instance for app-wide plugin access.
  static final PluginManager instance = PluginManager(PluginRegistry());

  /// Initializes from pre-bundled available plugins.
  ///
  /// **params**:
  /// * `available`: Bundled plugins
  /// * `active`: Active plugin IDs from the database
  ///
  /// **returns**:
  ///   None
  void initialize(
    List<TalawaMobilePlugin> available, {
    List<String>? active,
  }) {
    if (_initialized) return; // Prevent re-initialization

    print(
      'Plugin Manager: Initializing with ${available.length} bundled plugins',
    );
    print(
      'Available plugin IDs: ${available.map((p) => p.manifest.id).toList()}',
    );
    print('Active plugin IDs from database: $active');

    if (active == null || active.isEmpty) {
      print('No active plugins in database - skipping plugin registration');
      // Don't register any plugins if none are active
    } else {
      // Find bundled plugins that are activated in the database
      final filtered = available.where((p) {
        final isActive = active.contains(p.manifest.id);
        if (isActive) {
          print(
            '✓ Plugin "${p.manifest.id}" is bundled AND active - will register',
          );
        } else {
          print(
            '✗ Plugin "${p.manifest.id}" is bundled but NOT active - skipping',
          );
        }
        return isActive;
      }).toList();

      // Log any active plugins that aren't bundled
      for (final activeId in active) {
        if (!available.any((p) => p.manifest.id == activeId)) {
          print(
            '⚠ Plugin "$activeId" is active in database but NOT bundled in app',
          );
        }
      }

      registry.registerAll(filtered);
      print(
        'Registered ${filtered.length} plugins: ${filtered.map((p) => p.manifest.id).toList()}',
      );
    }
    _initialized = true;
    print(
      'Plugin Manager: Initialization complete. ${registry.all.length} plugins registered.',
    );
  }

  /// Resets the manager for testing or re-initialization.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void reset() {
    registry.clear();
    _initialized = false;
  }

  /// Whether the manager is initialized.
  ///
  /// **returns**:
  /// * `bool`: Initialization status
  bool get isInitialized => _initialized;

  /// Routes contributed by active plugins.
  ///
  /// **returns**:
  /// * `List<PluginRoute>`: Routes from plugins
  List<PluginRoute> get routes => registry.collectRoutes();

  /// Menu items contributed by active plugins.
  ///
  /// **params**:
  /// * `context`: Build context
  ///
  /// **returns**:
  /// * `List<PluginMenuItem>`: Menu items from plugins
  List<PluginMenuItem> getMenuItems(BuildContext context) =>
      registry.collectMenuItems(context);

  /// Gets injectors for a specific type.
  ///
  /// **params**:
  /// * `type`: Injector location/type
  ///
  /// **returns**:
  /// * `List<PluginInjectorExtension>`: Ordered injectors
  List<PluginInjectorExtension> getInjectors(InjectorType type) =>
      registry.collectInjectors(type);
}
