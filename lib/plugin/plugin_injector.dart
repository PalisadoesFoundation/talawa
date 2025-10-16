import 'package:flutter/material.dart';
import 'package:talawa/plugin/manager.dart';
import 'package:talawa/plugin/types.dart';

/// PluginInjector - Renders plugin-injected widgets at specific locations
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
  const PluginInjector({
    super.key,
    required this.injectorType,
    this.data,
    this.padding,
  });

  final InjectorType injectorType;
  final Map<String, dynamic>? data;
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

  Widget _buildInjectorWidget(
    BuildContext context,
    PluginInjectorExtension injector,
  ) {
    try {
      return injector.builder(context, data: data);
    } catch (e) {
      print('Error rendering plugin injector "${injector.name}": $e');
      return const SizedBox.shrink();
    }
  }
}
