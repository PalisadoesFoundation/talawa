import 'package:flutter/material.dart';
import 'package:talawa/plugin/manager.dart';
import 'package:talawa/plugin/types.dart';

/// Renders plugin-injected widgets at specific locations.
///
/// This widget allows plugins to inject custom UI components anywhere in the app
/// by specifying an injector type.
///
/// Currently supported injector types:
/// - g1: Menu page - under Plugins section
/// - g2: Post content - under post caption
///
/// Example usage:
/// ```dart
/// // In your screen/widget:
/// PluginInjector(
///   injectorType: InjectorType.g1,  // Menu page injector
/// )
/// ```
class PluginInjector extends StatelessWidget {
  /// Creates a widget for rendering plugin injectors.
  ///
  /// **params**:
  /// * `key`: Optional widget key
  /// * `injectorType`: Target injection location
  /// * `data`: Optional data passed to injectors
  /// * `padding`: Optional padding around injected widgets
  const PluginInjector({
    super.key,
    required this.injectorType,
    this.data,
    this.padding,
  });

  /// Target injection location.
  final InjectorType injectorType;

  /// Optional data passed to injectors.
  final Map<String, dynamic>? data;

  /// Optional padding around injected widgets.
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    // Skip if plugin system not initialized
    if (!PluginManager.instance.isInitialized) {
      return const SizedBox.shrink();
    }

    final injectors = PluginManager.instance.getInjectors(injectorType);

    if (injectors.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: injectors
          .map(
            (injector) => Padding(
              padding: padding ?? const EdgeInsets.symmetric(vertical: 4.0),
              child: _buildInjectorWidget(context, injector),
            ),
          )
          .toList(),
    );
  }

  /// Builds a single injector widget.
  ///
  /// **params**:
  /// * `context`: Build context
  /// * `injector`: Injector definition
  ///
  /// **returns**:
  /// * `Widget`: Built widget or empty box on error
  Widget _buildInjectorWidget(
    BuildContext context,
    PluginInjectorExtension injector,
  ) {
    try {
      return injector.builder(context, data: data);
    } catch (e) {
      debugPrint('Error rendering plugin injector "${injector.name}": $e');
      return const SizedBox.shrink();
    }
  }
}
