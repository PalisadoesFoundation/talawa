import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/plugins/talawa_plugin_provider.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

/// Test for talawa_plugin_provider_test.dart.
///
/// more_info_if_required
///
/// **params**:
///   None
///
/// **returns**:
///   None
void main() {
  testSetupLocator();
  TestWidgetsFlutterBinding.ensureInitialized();
  late Box box;

  final OrgInfo org = OrgInfo(
    id: 'org1',
    name: 'test org 3',
  );

  setUpAll(() async {
    registerServices();
    final Directory dir = await Directory.systemTemp.createTemp('talawa_test');
    Hive.init(dir.path);
    box = await Hive.openBox('pluginBox');
  });

  tearDownAll(() {
    unregisterServices();
    box.close();
    Hive.deleteBoxFromDisk('pluginBox');
    Hive.close();
  });

  group('TalawaPluginProvider Tests', () {
    testWidgets('Widget displays child when visible and plugins are installed',
        (WidgetTester tester) async {
      box.put(
        'plugins',
        [
          {
            '_id': '1',
            'pluginName': 'Plugin 1',
            'pluginCreatedBy': 'User A',
            'pluginDesc': 'Description A',
            'pluginInstallStatus': true,
            'installedOrgs': ['org1'],
          },
        ],
      );

      when(userConfig.currentOrg).thenReturn(org);

      await tester.pumpWidget(
        const MaterialApp(
          home: TalawaPluginProvider(
            visible: true,
            pluginName: 'Plugin 1',
            child: Text('Test Plugin'),
          ),
        ),
      );

      expect(find.text('Test Plugin'), findsOneWidget);
    });

    testWidgets(
        'Widget hides child when not visible and plugins are not installed',
        (WidgetTester tester) async {
      box.put(
        'plugins',
        [
          {
            '_id': '1',
            'pluginName': 'Plugin 1',
            'pluginCreatedBy': 'User A',
            'pluginDesc': 'Description A',
            'pluginInstallStatus': false,
            'installedOrgs': ['org2'],
          },
        ],
      );

      when(userConfig.currentOrg).thenReturn(org);
      await tester.pumpWidget(
        const MaterialApp(
          home: TalawaPluginProvider(
            visible: false,
            pluginName: 'Plugin 1',
            child: Text('Test Plugin'),
          ),
        ),
      );

      expect(find.text('Test Plugin'), findsNothing);
    });
    testWidgets(
        'Widget displays child when not visible and plugins are installed',
        (WidgetTester tester) async {
      box.put(
        'plugins',
        [
          {
            '_id': '1',
            'pluginName': 'Plugin 1',
            'pluginCreatedBy': 'User A',
            'pluginDesc': 'Description A',
            'pluginInstallStatus': true,
            'installedOrgs': ['org1'],
          },
        ],
      );

      when(userConfig.currentOrg).thenReturn(org);
      await tester.pumpWidget(
        const MaterialApp(
          home: TalawaPluginProvider(
            visible: false,
            pluginName: 'Plugin 1',
            child: Text('Test Plugin'),
          ),
        ),
      );

      expect(find.text('Test Plugin'), findsOneWidget);
    });
    testWidgets(
        'Widget displays child when not visible but plugin is already installed in that org',
        (WidgetTester tester) async {
      box.put(
        'plugins',
        [
          {
            '_id': '1',
            'pluginName': 'Plugin 1',
            'pluginCreatedBy': 'User A',
            'pluginDesc': 'Description A',
            'pluginInstallStatus': false,
            'installedOrgs': ['org1'],
          },
        ],
      );

      when(userConfig.currentOrg).thenReturn(org);
      await tester.pumpWidget(
        const MaterialApp(
          home: TalawaPluginProvider(
            visible: false,
            pluginName: 'Plugin 1',
            child: Text('Test Plugin'),
          ),
        ),
      );

      expect(find.text('Test Plugin'), findsOneWidget);
    });
    testWidgets(
        'Widget displays child when visible but plugins are not installed',
        (WidgetTester tester) async {
      box.put(
        'plugins',
        [
          {
            '_id': '1',
            'pluginName': 'Plugin 1',
            'pluginCreatedBy': 'User A',
            'pluginDesc': 'Description A',
            'pluginInstallStatus': false,
            'installedOrgs': ['org1'],
          },
        ],
      );

      when(userConfig.currentOrg).thenReturn(org);
      await tester.pumpWidget(
        const MaterialApp(
          home: TalawaPluginProvider(
            visible: true,
            pluginName: 'Plugin 1',
            child: Text('Test Plugin'),
          ),
        ),
      );

      expect(find.text('Test Plugin'), findsOneWidget);
    });
    testWidgets('Widget hides child when not visible and plugins is null',
        (WidgetTester tester) async {
      box.put('plugins', null);

      when(userConfig.currentOrg).thenReturn(org);
      await tester.pumpWidget(
        const MaterialApp(
          home: TalawaPluginProvider(
            visible: false,
            pluginName: 'Plugin 1',
            child: Text('Test Plugin'),
          ),
        ),
      );

      expect(find.text('Test Plugin'), findsNothing);
    });
    testWidgets(
        'Widget hides child when not visible and Current Organization is Not Set ',
        (WidgetTester tester) async {
      box.put(
        'plugins',
        [
          {
            '_id': '1',
            'pluginName': 'Plugin 1',
            'pluginCreatedBy': 'User A',
            'pluginDesc': 'Description A',
            'pluginInstallStatus': false,
            'installedOrgs': [''],
          },
        ],
      );

      when(userConfig.currentOrg).thenReturn(org);
      await tester.pumpWidget(
        const MaterialApp(
          home: TalawaPluginProvider(
            visible: false,
            pluginName: 'Plugin 1',
            child: Text('Test Plugin'),
          ),
        ),
      );

      expect(find.text('Test Plugin'), findsNothing);
    });
  });
}
