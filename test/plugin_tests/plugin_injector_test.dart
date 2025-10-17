import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/plugin/manager.dart';
import 'package:talawa/plugin/plugin_injector.dart';
import 'package:talawa/plugin/types.dart';

import '../helpers/test_locator.dart';

// Mock Plugin for testing
class MockPluginForInjector implements TalawaMobilePlugin {
  MockPluginForInjector(
    this.id, {
    this.g1Extensions = const [],
    this.g2Extensions = const [],
  });

  final String id;
  final List<PluginInjectorExtension> g1Extensions;
  final List<PluginInjectorExtension> g2Extensions;

  @override
  PluginManifest get manifest => PluginManifest(
        id: id,
        name: '$id Name',
      );

  @override
  List<PluginRoute> getRoutes() => [];

  @override
  List<PluginMenuItem> getMenuItems(BuildContext context) => [];

  @override
  PluginExtensions getExtensions() => PluginExtensions(
        g1: g1Extensions,
        g2: g2Extensions,
      );
}

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
  });

  setUp(() {
    PluginManager.instance.reset();
  });

  tearDown(() {
    PluginManager.instance.reset();
  });

  group('PluginInjector Widget Tests', () {
    testWidgets('should render nothing when plugin system not initialized',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PluginInjector(
              injectorType: InjectorType.g1,
            ),
          ),
        ),
      );

      expect(find.byType(Column), findsNothing);
      expect(find.byType(SizedBox), findsOneWidget);
    });

    testWidgets('should render nothing when no injectors registered',
        (tester) async {
      final plugin = MockPluginForInjector('plugin1');

      PluginManager.instance.initialize(
        [plugin],
        active: ['plugin1'],
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PluginInjector(
              injectorType: InjectorType.g1,
            ),
          ),
        ),
      );

      expect(find.byType(Column), findsNothing);
      expect(find.byType(SizedBox), findsOneWidget);
    });

    testWidgets('should render g1 injectors', (tester) async {
      final plugin = MockPluginForInjector(
        'plugin1',
        g1Extensions: [
          PluginInjectorExtension(
            pluginId: 'plugin1',
            name: 'test-injector',
            order: 1,
            builder: (context, {data}) => const Text('G1 Injector'),
          ),
        ],
      );

      PluginManager.instance.initialize(
        [plugin],
        active: ['plugin1'],
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PluginInjector(
              injectorType: InjectorType.g1,
            ),
          ),
        ),
      );

      expect(find.text('G1 Injector'), findsOneWidget);
      expect(find.byType(Column), findsOneWidget);
    });

    testWidgets('should render g2 injectors', (tester) async {
      final plugin = MockPluginForInjector(
        'plugin1',
        g2Extensions: [
          PluginInjectorExtension(
            pluginId: 'plugin1',
            name: 'test-injector',
            order: 1,
            builder: (context, {data}) => const Text('G2 Injector'),
          ),
        ],
      );

      PluginManager.instance.initialize(
        [plugin],
        active: ['plugin1'],
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PluginInjector(
              injectorType: InjectorType.g2,
            ),
          ),
        ),
      );

      expect(find.text('G2 Injector'), findsOneWidget);
      expect(find.byType(Column), findsOneWidget);
    });

    testWidgets('should render multiple injectors', (tester) async {
      final plugin = MockPluginForInjector(
        'plugin1',
        g1Extensions: [
          PluginInjectorExtension(
            pluginId: 'plugin1',
            name: 'injector-1',
            order: 1,
            builder: (context, {data}) => const Text('Injector 1'),
          ),
          PluginInjectorExtension(
            pluginId: 'plugin1',
            name: 'injector-2',
            order: 2,
            builder: (context, {data}) => const Text('Injector 2'),
          ),
        ],
      );

      PluginManager.instance.initialize(
        [plugin],
        active: ['plugin1'],
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PluginInjector(
              injectorType: InjectorType.g1,
            ),
          ),
        ),
      );

      expect(find.text('Injector 1'), findsOneWidget);
      expect(find.text('Injector 2'), findsOneWidget);
      expect(find.byType(Padding), findsNWidgets(2));
    });

    testWidgets('should pass data to injectors', (tester) async {
      String? receivedData;

      final plugin = MockPluginForInjector(
        'plugin1',
        g1Extensions: [
          PluginInjectorExtension(
            pluginId: 'plugin1',
            name: 'test-injector',
            order: 1,
            builder: (context, {data}) {
              receivedData = data?['testKey'] as String?;
              return Text('Data: $receivedData');
            },
          ),
        ],
      );

      PluginManager.instance.initialize(
        [plugin],
        active: ['plugin1'],
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PluginInjector(
              injectorType: InjectorType.g1,
              data: {'testKey': 'testValue'},
            ),
          ),
        ),
      );

      expect(find.text('Data: testValue'), findsOneWidget);
      expect(receivedData, equals('testValue'));
    });

    testWidgets('should apply custom padding', (tester) async {
      final plugin = MockPluginForInjector(
        'plugin1',
        g1Extensions: [
          PluginInjectorExtension(
            pluginId: 'plugin1',
            name: 'test-injector',
            order: 1,
            builder: (context, {data}) => const Text('Test'),
          ),
        ],
      );

      PluginManager.instance.initialize(
        [plugin],
        active: ['plugin1'],
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PluginInjector(
              injectorType: InjectorType.g1,
              padding: EdgeInsets.all(20.0),
            ),
          ),
        ),
      );

      final padding = tester.widget<Padding>(find.byType(Padding).first);
      expect(padding.padding, equals(const EdgeInsets.all(20.0)));
    });

    testWidgets('should use default padding when not specified',
        (tester) async {
      final plugin = MockPluginForInjector(
        'plugin1',
        g1Extensions: [
          PluginInjectorExtension(
            pluginId: 'plugin1',
            name: 'test-injector',
            order: 1,
            builder: (context, {data}) => const Text('Test'),
          ),
        ],
      );

      PluginManager.instance.initialize(
        [plugin],
        active: ['plugin1'],
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PluginInjector(
              injectorType: InjectorType.g1,
            ),
          ),
        ),
      );

      final padding = tester.widget<Padding>(find.byType(Padding).first);
      expect(
          padding.padding, equals(const EdgeInsets.symmetric(vertical: 4.0)));
    });

    testWidgets('should handle injector builder errors gracefully',
        (tester) async {
      final plugin = MockPluginForInjector(
        'plugin1',
        g1Extensions: [
          PluginInjectorExtension(
            pluginId: 'plugin1',
            name: 'error-injector',
            order: 1,
            builder: (context, {data}) {
              throw Exception('Test error');
            },
          ),
        ],
      );

      PluginManager.instance.initialize(
        [plugin],
        active: ['plugin1'],
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PluginInjector(
              injectorType: InjectorType.g1,
            ),
          ),
        ),
      );

      // Should render empty SizedBox instead of crashing
      expect(find.byType(Column), findsOneWidget);
      expect(find.byType(SizedBox), findsOneWidget);
    });

    testWidgets('should render injectors in correct order', (tester) async {
      final plugin = MockPluginForInjector(
        'plugin1',
        g1Extensions: [
          PluginInjectorExtension(
            pluginId: 'plugin1',
            name: 'injector-3',
            order: 3,
            builder: (context, {data}) => const Text('Third'),
          ),
          PluginInjectorExtension(
            pluginId: 'plugin1',
            name: 'injector-1',
            order: 1,
            builder: (context, {data}) => const Text('First'),
          ),
          PluginInjectorExtension(
            pluginId: 'plugin1',
            name: 'injector-2',
            order: 2,
            builder: (context, {data}) => const Text('Second'),
          ),
        ],
      );

      PluginManager.instance.initialize(
        [plugin],
        active: ['plugin1'],
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PluginInjector(
              injectorType: InjectorType.g1,
            ),
          ),
        ),
      );

      // Find all Text widgets
      final textWidgets = tester.widgetList<Text>(find.byType(Text)).toList();
      expect(textWidgets[0].data, equals('First'));
      expect(textWidgets[1].data, equals('Second'));
      expect(textWidgets[2].data, equals('Third'));
    });

    testWidgets('should handle null data parameter', (tester) async {
      final plugin = MockPluginForInjector(
        'plugin1',
        g1Extensions: [
          PluginInjectorExtension(
            pluginId: 'plugin1',
            name: 'test-injector',
            order: 1,
            builder: (context, {data}) {
              return Text('Data is ${data == null ? "null" : "not null"}');
            },
          ),
        ],
      );

      PluginManager.instance.initialize(
        [plugin],
        active: ['plugin1'],
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PluginInjector(
              injectorType: InjectorType.g1,
            ),
          ),
        ),
      );

      expect(find.text('Data is null'), findsOneWidget);
    });

    testWidgets('should render widgets with proper stretch alignment',
        (tester) async {
      final plugin = MockPluginForInjector(
        'plugin1',
        g1Extensions: [
          PluginInjectorExtension(
            pluginId: 'plugin1',
            name: 'test-injector',
            order: 1,
            builder: (context, {data}) => const Text('Test'),
          ),
        ],
      );

      PluginManager.instance.initialize(
        [plugin],
        active: ['plugin1'],
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PluginInjector(
              injectorType: InjectorType.g1,
            ),
          ),
        ),
      );

      final column = tester.widget<Column>(find.byType(Column));
      expect(column.crossAxisAlignment, equals(CrossAxisAlignment.stretch));
    });
  });
}
