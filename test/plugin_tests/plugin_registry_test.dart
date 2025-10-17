// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/plugin/registry.dart';
import 'package:talawa/plugin/types.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

class MockBuildContext extends Mock implements BuildContext {}

/// Mock plugin for testing.
class MockPlugin implements TalawaMobilePlugin {
  MockPlugin(this.id, {this.routeCount = 1, this.menuItemCount = 1});

  final String id;
  final int routeCount;
  final int menuItemCount;

  @override
  PluginManifest get manifest => PluginManifest(
        id: id,
        name: 'Mock Plugin $id',
        description: 'A mock plugin for testing',
      );

  @override
  List<PluginRoute> getRoutes() {
    return List.generate(
      routeCount,
      (index) => PluginRoute(
        routeName: '/plugin_${id}_route_$index',
        builder: (context) => const Placeholder(),
      ),
    );
  }

  @override
  List<PluginMenuItem> getMenuItems(BuildContext context) {
    return List.generate(
      menuItemCount,
      (index) => PluginMenuItem(
        title: 'Plugin $id Item $index',
        icon: Icons.extension,
        routeName: '/plugin_${id}_route_$index',
      ),
    );
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

  group('PluginRegistry Tests', () {
    late PluginRegistry registry;

    setUp(() {
      registry = PluginRegistry();
    });

    test('register should add a plugin to the registry', () {
      final plugin = MockPlugin('plugin1');

      registry.register(plugin);

      expect(registry.all.length, equals(1));
      expect(registry.all.first.manifest.id, equals('plugin1'));
    });

    test('register should replace plugin with same ID', () {
      final plugin1 = MockPlugin('plugin1');
      final plugin2 = MockPlugin('plugin1'); // Same ID

      registry.register(plugin1);
      registry.register(plugin2);

      expect(registry.all.length, equals(1));
      expect(registry.all.first, equals(plugin2));
    });

    test('registerAll should add multiple plugins', () {
      final plugin1 = MockPlugin('plugin1');
      final plugin2 = MockPlugin('plugin2');
      final plugin3 = MockPlugin('plugin3');

      registry.registerAll([plugin1, plugin2, plugin3]);

      expect(registry.all.length, equals(3));
    });

    test('clear should remove all plugins', () {
      final plugin1 = MockPlugin('plugin1');
      final plugin2 = MockPlugin('plugin2');

      registry.registerAll([plugin1, plugin2]);
      expect(registry.all.length, equals(2));

      registry.clear();

      expect(registry.all.length, equals(0));
    });

    test('all should return unmodifiable list', () {
      final plugin1 = MockPlugin('plugin1');
      final plugin2 = MockPlugin('plugin2');

      registry.registerAll([plugin1, plugin2]);

      final allPlugins = registry.all;
      expect(allPlugins.length, equals(2));

      // Returned list should not be growable
      expect(
          () => allPlugins.add(MockPlugin('plugin3')), throwsUnsupportedError);
    });

    test('collectRoutes should return all routes from all plugins', () {
      final plugin1 = MockPlugin('plugin1', routeCount: 2);
      final plugin2 = MockPlugin('plugin2', routeCount: 3);

      registry.registerAll([plugin1, plugin2]);

      final routes = registry.collectRoutes();
      expect(routes.length, equals(5)); // 2 + 3
      expect(
          routes.any((r) => r.routeName == '/plugin_plugin1_route_0'), isTrue);
      expect(
          routes.any((r) => r.routeName == '/plugin_plugin2_route_2'), isTrue);
    });

    test('collectMenuItems should return all menu items from all plugins', () {
      final plugin1 = MockPlugin('plugin1', menuItemCount: 2);
      final plugin2 = MockPlugin('plugin2', menuItemCount: 1);

      registry.registerAll([plugin1, plugin2]);

      final menuItems = registry.collectMenuItems(MockBuildContext());
      expect(menuItems.length, equals(3)); // 2 + 1
      expect(
        menuItems.any((item) => item.title == 'Plugin plugin1 Item 0'),
        isTrue,
      );
      expect(
        menuItems.any((item) => item.title == 'Plugin plugin2 Item 0'),
        isTrue,
      );
    });

    test('collectInjectors should return g1 injectors sorted by order', () {
      final plugin1 = MockPlugin('plugin1');
      final plugin2 = MockPlugin('plugin2');

      registry.registerAll([plugin1, plugin2]);

      final injectors = registry.collectInjectors(InjectorType.g1);
      expect(injectors.length, equals(2));
    });

    test('collectInjectors should return g2 injectors sorted by order', () {
      final plugin1 = MockPlugin('plugin1');
      final plugin2 = MockPlugin('plugin2');

      registry.registerAll([plugin1, plugin2]);

      final injectors = registry.collectInjectors(InjectorType.g2);
      expect(injectors.length, equals(2));
    });

    test('collectInjectors should sort by order correctly', () {
      // Create custom plugin with specific order
      final customPlugin1 = CustomOrderPlugin('custom1', g1Order: 10);
      final customPlugin2 = CustomOrderPlugin('custom2', g1Order: 5);
      final customPlugin3 = CustomOrderPlugin('custom3', g1Order: 15);

      registry.registerAll([customPlugin1, customPlugin2, customPlugin3]);

      final injectors = registry.collectInjectors(InjectorType.g1);
      expect(injectors.length, equals(3));
      expect(injectors[0].order, equals(5));
      expect(injectors[1].order, equals(10));
      expect(injectors[2].order, equals(15));
    });

    test('collectRoutes should return unmodifiable list', () {
      final plugin1 = MockPlugin('plugin1');
      registry.register(plugin1);

      final routes = registry.collectRoutes();
      expect(
          () => routes.add(PluginRoute(
                routeName: '/test',
                builder: (context) => const Placeholder(),
              )),
          throwsUnsupportedError);
    });
  });
}

/// Plugin with custom order for testing sorting.
class CustomOrderPlugin implements TalawaMobilePlugin {
  CustomOrderPlugin(this.id, {required this.g1Order, this.g2Order = 0});

  final String id;
  final int g1Order;
  final int g2Order;

  @override
  PluginManifest get manifest => PluginManifest(
        id: id,
        name: 'Custom Plugin $id',
      );

  @override
  List<PluginRoute> getRoutes() => [];

  @override
  List<PluginMenuItem> getMenuItems(BuildContext context) => [];

  @override
  PluginExtensions getExtensions() {
    return PluginExtensions(
      g1: [
        PluginInjectorExtension(
          pluginId: id,
          name: 'G1 Extension',
          builder: (context, {data}) => Text('G1 from $id'),
          order: g1Order,
        ),
      ],
      g2: [
        PluginInjectorExtension(
          pluginId: id,
          name: 'G2 Extension',
          builder: (context, {data}) => Text('G2 from $id'),
          order: g2Order,
        ),
      ],
    );
  }
}
