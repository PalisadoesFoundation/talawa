import 'package:flutter/material.dart';
import 'package:talawa/plugin/types.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/plugin/available/plugin_map/manifest.dart';
import 'package:talawa/plugin/available/plugin_map/routes.dart';

/// g1 injector - Menu page plugins section
List<PluginInjectorExtension> g1MenuInjectors() {
  return [
    PluginInjectorExtension(
      pluginId: pluginMapManifest.id,
      name: 'Plugin Map',
      description: 'Plugin Map documentation and demo',
      order: 0,
      builder: (context, {data}) => Card(
        margin: const EdgeInsets.symmetric(vertical: 4),
        elevation: 2,
        child: ListTile(
          leading: const Icon(Icons.map_outlined, color: Colors.green, size: 30),
          title: const Text('Plugin Map'),
          subtitle: const Text('Documentation: menu & routes'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () => navigationService.pushScreen(PluginMapRoutes.docs),
        ),
      ),
    ),
  ];
}

