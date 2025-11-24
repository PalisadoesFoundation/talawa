// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/plugin/index.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

class MockBuildContext extends Mock implements BuildContext {}

/// Mock plugin for testing.
class MockPlugin implements TalawaMobilePlugin {
  MockPlugin(this.id, {this.routeCount = 1});

  final String id;
  final int routeCount;

  @override
  PluginManifest get manifest => PluginManifest(
        id: id,
        name: 'Mock Plugin $id',
      );

  @override
  List<PluginRoute> getRoutes() {
    return List.generate(
      routeCount,
      (index) => PluginRoute(
        routeName: '/plugin_${id}_route_$index',
        builder: (context) => Scaffold(
          body: Text('Plugin $id Route $index'),
        ),
      ),
    );
  }

  @override
  List<PluginMenuItem> getMenuItems(BuildContext context) => [];

  @override
  PluginExtensions getExtensions() => const PluginExtensions();
}

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    registerServices();
  });

  setUp(() {
    // Reset the plugin manager before each test
    PluginManager.instance.reset();
  });

  group('buildPluginRoutes Tests', () {
    test('should return empty map when no plugins are registered', () {
      final routes = buildPluginRoutes();

      expect(routes, isEmpty);
      expect(routes, isA<Map<String, WidgetBuilder>>());
    });

    test('should return routes from registered plugins', () {
      final plugin1 = MockPlugin('plugin1', routeCount: 2);
      final plugin2 = MockPlugin('plugin2', routeCount: 1);

      PluginManager.instance.initialize(
        [plugin1, plugin2],
        active: ['plugin1', 'plugin2'],
      );

      final routes = buildPluginRoutes();

      expect(routes.length, equals(3)); // 2 + 1
      expect(routes.containsKey('/plugin_plugin1_route_0'), isTrue);
      expect(routes.containsKey('/plugin_plugin1_route_1'), isTrue);
      expect(routes.containsKey('/plugin_plugin2_route_0'), isTrue);
    });

    test('routes should be valid WidgetBuilders', () {
      final plugin = MockPlugin('plugin1');

      PluginManager.instance.initialize(
        [plugin],
        active: ['plugin1'],
      );

      final routes = buildPluginRoutes();
      final builder = routes['/plugin_plugin1_route_0'];

      expect(builder, isNotNull);

      // Build the widget and verify it's a valid Widget
      final widget = builder!(MockBuildContext());
      expect(widget, isA<Widget>());
      expect(widget, isA<Scaffold>());
    });

    test('should handle multiple plugins with same route prefix', () {
      final plugin1 = MockPlugin('plugin1');
      final plugin2 = MockPlugin('plugin1'); // Same ID, different instance

      PluginManager.instance.initialize(
        [plugin1, plugin2],
        active: ['plugin1'],
      );

      final routes = buildPluginRoutes();

      // Should only have one route since the second plugin replaces the first
      expect(routes.length, equals(1));
      expect(routes.containsKey('/plugin_plugin1_route_0'), isTrue);
    });

    test('should return new map on each call', () {
      final plugin = MockPlugin('plugin1');

      PluginManager.instance.initialize(
        [plugin],
        active: ['plugin1'],
      );

      final routes1 = buildPluginRoutes();
      final routes2 = buildPluginRoutes();

      // Should be different map instances
      expect(identical(routes1, routes2), isFalse);
      // Should have same keys
      expect(routes1.keys.toList(), equals(routes2.keys.toList()));
      // Should be able to modify one without affecting the other
      routes1['/test'] = (context) => Container();
      expect(routes2.containsKey('/test'), isFalse);
    });

    test('should handle plugin with no routes', () {
      final plugin = MockPlugin('plugin1', routeCount: 0);

      PluginManager.instance.initialize(
        [plugin],
        active: ['plugin1'],
      );

      final routes = buildPluginRoutes();

      expect(routes, isEmpty);
    });

    test('should preserve route order from plugin manager', () {
      final plugin1 = MockPlugin('plugin1', routeCount: 2);

      PluginManager.instance.initialize(
        [plugin1],
        active: ['plugin1'],
      );

      final routes = buildPluginRoutes();
      final routeKeys = routes.keys.toList();

      expect(routeKeys[0], equals('/plugin_plugin1_route_0'));
      expect(routeKeys[1], equals('/plugin_plugin1_route_1'));
    });
  });
}
