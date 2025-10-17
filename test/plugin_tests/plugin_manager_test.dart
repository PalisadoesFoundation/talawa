// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/plugin/manager.dart';
import 'package:talawa/plugin/types.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

class MockBuildContext extends Mock implements BuildContext {}

/// Mock plugin for testing.
class MockPlugin implements TalawaMobilePlugin {
  MockPlugin(this.id);

  final String id;

  @override
  PluginManifest get manifest => PluginManifest(
        id: id,
        name: 'Mock Plugin $id',
        description: 'A mock plugin for testing',
      );

  @override
  List<PluginRoute> getRoutes() {
    return [
      PluginRoute(
        routeName: '/plugin_$id',
        builder: (context) => const Placeholder(),
      ),
    ];
  }

  @override
  List<PluginMenuItem> getMenuItems(BuildContext context) {
    return [
      PluginMenuItem(
        title: 'Plugin $id Item',
        icon: Icons.extension,
        routeName: '/plugin_$id',
      ),
    ];
  }

  @override
  PluginExtensions getExtensions() {
    return PluginExtensions(
      g1: [
        PluginInjectorExtension(
          pluginId: id,
          name: 'G1 Extension',
          builder: (context, {data}) => Text('G1 from $id'),
          order: 0,
        ),
      ],
      g2: [
        PluginInjectorExtension(
          pluginId: id,
          name: 'G2 Extension',
          builder: (context, {data}) => Text('G2 from $id'),
          order: 0,
        ),
      ],
    );
  }
}

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    registerServices();
  });

  setUp(() {
    // Reset the singleton instance before each test
    PluginManager.instance.reset();
  });

  group('PluginManager Tests', () {
    test('PluginManager should be a singleton', () {
      final instance1 = PluginManager.instance;
      final instance2 = PluginManager.instance;

      expect(instance1, equals(instance2));
    });

    test('initialize should register active plugins only', () {
      final plugin1 = MockPlugin('plugin1');
      final plugin2 = MockPlugin('plugin2');
      final plugin3 = MockPlugin('plugin3');

      PluginManager.instance.initialize(
        [plugin1, plugin2, plugin3],
        active: ['plugin1', 'plugin3'],
      );

      final registeredPlugins = PluginManager.instance.registry.all;
      expect(registeredPlugins.length, equals(2));
      expect(registeredPlugins.any((p) => p.manifest.id == 'plugin1'), isTrue);
      expect(registeredPlugins.any((p) => p.manifest.id == 'plugin3'), isTrue);
      expect(
        registeredPlugins.any((p) => p.manifest.id == 'plugin2'),
        isFalse,
      );
    });

    test('initialize should register no plugins when active list is empty', () {
      final plugin1 = MockPlugin('plugin1');
      final plugin2 = MockPlugin('plugin2');

      PluginManager.instance.initialize(
        [plugin1, plugin2],
        active: [],
      );

      final registeredPlugins = PluginManager.instance.registry.all;
      expect(registeredPlugins.length, equals(0));
    });

    test('initialize should register no plugins when active list is null', () {
      final plugin1 = MockPlugin('plugin1');
      final plugin2 = MockPlugin('plugin2');

      PluginManager.instance.initialize([plugin1, plugin2]);

      final registeredPlugins = PluginManager.instance.registry.all;
      expect(registeredPlugins.length, equals(0));
    });

    test('initialize should prevent re-initialization', () {
      final plugin1 = MockPlugin('plugin1');
      final plugin2 = MockPlugin('plugin2');

      PluginManager.instance.initialize(
        [plugin1],
        active: ['plugin1'],
      );

      // Try to re-initialize with different plugins
      PluginManager.instance.initialize(
        [plugin2],
        active: ['plugin2'],
      );

      final registeredPlugins = PluginManager.instance.registry.all;
      // Should still have only plugin1
      expect(registeredPlugins.length, equals(1));
      expect(registeredPlugins.first.manifest.id, equals('plugin1'));
    });

    test('reset should clear all plugins and allow re-initialization', () {
      final plugin1 = MockPlugin('plugin1');
      final plugin2 = MockPlugin('plugin2');

      PluginManager.instance.initialize(
        [plugin1],
        active: ['plugin1'],
      );

      expect(PluginManager.instance.registry.all.length, equals(1));

      PluginManager.instance.reset();

      expect(PluginManager.instance.registry.all.length, equals(0));
      expect(PluginManager.instance.isInitialized, isFalse);

      // Should be able to initialize again
      PluginManager.instance.initialize(
        [plugin2],
        active: ['plugin2'],
      );

      expect(PluginManager.instance.registry.all.length, equals(1));
      expect(PluginManager.instance.registry.all.first.manifest.id,
          equals('plugin2'));
    });

    test('routes getter should return all plugin routes', () {
      final plugin1 = MockPlugin('plugin1');
      final plugin2 = MockPlugin('plugin2');

      PluginManager.instance.initialize(
        [plugin1, plugin2],
        active: ['plugin1', 'plugin2'],
      );

      final routes = PluginManager.instance.routes;
      expect(routes.length, equals(2));
      expect(routes.any((r) => r.routeName == '/plugin_plugin1'), isTrue);
      expect(routes.any((r) => r.routeName == '/plugin_plugin2'), isTrue);
    });

    test('getMenuItems should return all plugin menu items', () {
      final plugin1 = MockPlugin('plugin1');
      final plugin2 = MockPlugin('plugin2');

      PluginManager.instance.initialize(
        [plugin1, plugin2],
        active: ['plugin1', 'plugin2'],
      );

      final menuItems = PluginManager.instance.getMenuItems(
        MockBuildContext(),
      );
      expect(menuItems.length, equals(2));
      expect(
          menuItems.any((item) => item.title == 'Plugin plugin1 Item'), isTrue);
      expect(
          menuItems.any((item) => item.title == 'Plugin plugin2 Item'), isTrue);
    });

    test('getInjectors should return injectors for specific type', () {
      final plugin1 = MockPlugin('plugin1');
      final plugin2 = MockPlugin('plugin2');

      PluginManager.instance.initialize(
        [plugin1, plugin2],
        active: ['plugin1', 'plugin2'],
      );

      final g1Injectors = PluginManager.instance.getInjectors(InjectorType.g1);
      expect(g1Injectors.length, equals(2));

      final g2Injectors = PluginManager.instance.getInjectors(InjectorType.g2);
      expect(g2Injectors.length, equals(2));
    });

    test('isInitialized should reflect initialization state', () {
      expect(PluginManager.instance.isInitialized, isFalse);

      final plugin1 = MockPlugin('plugin1');
      PluginManager.instance.initialize(
        [plugin1],
        active: ['plugin1'],
      );

      expect(PluginManager.instance.isInitialized, isTrue);

      PluginManager.instance.reset();

      expect(PluginManager.instance.isInitialized, isFalse);
    });
  });
}
