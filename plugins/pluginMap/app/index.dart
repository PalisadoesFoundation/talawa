import 'package:flutter/material.dart';
import 'package:talawa/plugin/types.dart';
import 'package:talawa/plugin/available/plugin_map/manifest.dart';
import 'package:talawa/plugin/available/plugin_map/routes.dart';
import 'package:talawa/plugin/available/plugin_map/pages.dart';
import 'package:talawa/plugin/available/plugin_map/injectors.dart';

/// A documentation plugin showing how mobile plugins inject menu items and routes.
class PluginMapAppPlugin implements TalawaMobilePlugin {
  @override
  PluginManifest get manifest => pluginMapManifest;

  @override
  List<PluginMenuItem> getMenuItems(BuildContext context) => [];

  @override
  List<PluginRoute> getRoutes() => [
        PluginRoute(
          routeName: PluginMapRoutes.docs,
          builder: (c) => const PluginMapDocsPage(),
        ),
      ];

  @override
  PluginExtensions getExtensions() {
    return PluginExtensions(
      g1: g1MenuInjectors(),
    );
  }
}

