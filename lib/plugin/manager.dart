import 'package:flutter/widgets.dart';
import 'package:talawa/plugin/registry.dart';
import 'package:talawa/plugin/types.dart';

/// A thin manager that wires the registry with bundled plugins.
class PluginManager {
  final PluginRegistry registry;
  bool _initialized = false;

  PluginManager(this.registry);

  /// Global singleton instance for app-wide plugin access
  static final PluginManager instance = PluginManager(PluginRegistry());

  /// Initialize from pre-bundled available plugins.
  /// Only registers bundled plugins that are marked as activated in the database.
  void initialize(List<TalawaMobilePlugin> available, {List<String>? active}) {
    if (_initialized) return; // Prevent re-initialization
    
    print('Plugin Manager: Initializing with ${available.length} bundled plugins');
    print('Available plugin IDs: ${available.map((p) => p.manifest.id).toList()}');
    print('Active plugin IDs from database: $active');
    
    if (active == null || active.isEmpty) {
      print('No active list provided, registering all bundled plugins');
      registry.registerAll(available);
    } else {
      // Find bundled plugins that are activated in the database
      final filtered = available.where((p) {
        final isActive = active.contains(p.manifest.id);
        if (isActive) {
          print('✓ Plugin "${p.manifest.id}" is bundled AND active - will register');
        } else {
          print('✗ Plugin "${p.manifest.id}" is bundled but NOT active - skipping');
        }
        return isActive;
      }).toList();
      
      // Log any active plugins that aren't bundled
      for (final activeId in active) {
        if (!available.any((p) => p.manifest.id == activeId)) {
          print('⚠ Plugin "$activeId" is active in database but NOT bundled in app');
        }
      }
      
      registry.registerAll(filtered);
      print('Registered ${filtered.length} plugins: ${filtered.map((p) => p.manifest.id).toList()}');
    }
    _initialized = true;
    print('Plugin Manager: Initialization complete. ${registry.all.length} plugins registered.');
  }

  /// Reset for testing or re-initialization
  void reset() {
    registry.clear();
    _initialized = false;
  }

  bool get isInitialized => _initialized;

  List<PluginRoute> get routes => registry.collectRoutes();

  List<PluginMenuItem> getMenuItems(BuildContext context) =>
      registry.collectMenuItems(context);

  /// Get injectors for a specific type
  List<PluginInjectorExtension> getInjectors(InjectorType type) =>
      registry.collectInjectors(type);
}
