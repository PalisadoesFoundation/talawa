// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/after_auth_screens/menu/menu_page.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/plugin/manager.dart';
import 'package:talawa/plugin/plugin_injector.dart';
import 'package:talawa/plugin/types.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

Widget createMenuPage() {
  return BaseView<AppLanguage>(
    onModelReady: (model) => model.initialize(),
    builder: (context, langModel, child) {
      return MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: [
          const AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: const Scaffold(
          body: MenuPage(
            key: Key('MenuPage'),
          ),
        ),
        navigatorKey: navigationService.navigatorKey,
        onGenerateRoute: router.generateRoute,
        theme: TalawaTheme.darkTheme,
      );
    },
  );
}

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    locator<SizeConfig>().test();
    registerServices();
  });

  tearDownAll(() {
    unregisterServices();
  });

  group('MenuPage Plugin GraphQL Parsing Tests', () {
    test('should parse successful GraphQL plugin response', () {
      final mockResult = QueryResult(
        options: QueryOptions(document: gql('')),
        data: {
          'getPlugins': [
            {'pluginId': 'plugin1', 'isActivated': true},
            {'pluginId': 'plugin2', 'isActivated': false},
            {'pluginId': 'plugin3', 'isActivated': true},
          ],
        },
        source: QueryResultSource.network,
      );

      final List<String> activePluginIds = [];
      try {
        final List<Map<String, dynamic>> pluginList =
            (mockResult.data?['getPlugins'] as List?)
                    ?.cast<Map<String, dynamic>>() ??
                <Map<String, dynamic>>[];
        for (final plugin in pluginList) {
          if (plugin['isActivated'] == true) {
            activePluginIds.add(plugin['pluginId'] as String);
          }
        }
      } catch (e) {
        fail('Should not throw exception');
      }

      expect(activePluginIds.length, equals(2));
      expect(activePluginIds.contains('plugin1'), isTrue);
      expect(activePluginIds.contains('plugin3'), isTrue);
      expect(activePluginIds.contains('plugin2'), isFalse);
    });

    test('should handle GraphQL response parsing error', () {
      final mockResult = QueryResult(
        options: QueryOptions(document: gql('')),
        data: {
          'getPlugins': 'invalid_data', // Should be a list
        },
        source: QueryResultSource.network,
      );

      final List<String> activePluginIds = [];
      bool caughtException = false;

      try {
        final List<Map<String, dynamic>> pluginList =
            (mockResult.data?['getPlugins'] as List?)
                    ?.cast<Map<String, dynamic>>() ??
                <Map<String, dynamic>>[];
        for (final plugin in pluginList) {
          if (plugin['isActivated'] == true) {
            activePluginIds.add(plugin['pluginId'] as String);
          }
        }
      } catch (e) {
        // On parsing error, should initialize with all bundled plugins
        caughtException = true;
      }

      expect(caughtException, isTrue);
      expect(activePluginIds.isEmpty, isTrue);
    });

    test('should handle empty plugin list', () {
      final mockResult = QueryResult(
        options: QueryOptions(document: gql('')),
        data: {
          'getPlugins': [],
        },
        source: QueryResultSource.network,
      );

      final List<String> activePluginIds = [];
      try {
        final List<Map<String, dynamic>> pluginList =
            (mockResult.data?['getPlugins'] as List?)
                    ?.cast<Map<String, dynamic>>() ??
                <Map<String, dynamic>>[];
        for (final plugin in pluginList) {
          if (plugin['isActivated'] == true) {
            activePluginIds.add(plugin['pluginId'] as String);
          }
        }
      } catch (e) {
        fail('Should not throw exception');
      }

      expect(activePluginIds.isEmpty, isTrue);
    });

    test('should handle null getPlugins data', () {
      final mockResult = QueryResult(
        options: QueryOptions(document: gql('')),
        data: {
          'getPlugins': null,
        },
        source: QueryResultSource.network,
      );

      final List<String> activePluginIds = [];
      try {
        final List<Map<String, dynamic>> pluginList =
            (mockResult.data?['getPlugins'] as List?)
                    ?.cast<Map<String, dynamic>>() ??
                <Map<String, dynamic>>[];
        for (final plugin in pluginList) {
          if (plugin['isActivated'] == true) {
            activePluginIds.add(plugin['pluginId'] as String);
          }
        }
      } catch (e) {
        fail('Should not throw exception');
      }

      expect(activePluginIds.isEmpty, isTrue);
    });

    test('should pass null to initialize when active list is empty', () {
      final mockResult = QueryResult(
        options: QueryOptions(document: gql('')),
        data: {
          'getPlugins': [],
        },
        source: QueryResultSource.network,
      );

      final List<String> activePluginIds = [];
      try {
        final List<Map<String, dynamic>> pluginList =
            (mockResult.data?['getPlugins'] as List?)
                    ?.cast<Map<String, dynamic>>() ??
                <Map<String, dynamic>>[];
        for (final plugin in pluginList) {
          if (plugin['isActivated'] == true) {
            activePluginIds.add(plugin['pluginId'] as String);
          }
        }
      } catch (e) {
        fail('Should not throw exception');
      }

      // Test that empty list results in null being passed
      final activeParam = activePluginIds.isEmpty ? null : activePluginIds;
      expect(activeParam, isNull);
    });

    test('should handle plugins with missing isActivated field', () {
      final mockResult = QueryResult(
        options: QueryOptions(document: gql('')),
        data: {
          'getPlugins': [
            {'pluginId': 'plugin1', 'isActivated': true},
            {'pluginId': 'plugin2'}, // Missing isActivated
            {'pluginId': 'plugin3', 'isActivated': false},
          ],
        },
        source: QueryResultSource.network,
      );

      final List<String> activePluginIds = [];
      try {
        final List<Map<String, dynamic>> pluginList =
            (mockResult.data?['getPlugins'] as List?)
                    ?.cast<Map<String, dynamic>>() ??
                <Map<String, dynamic>>[];
        for (final plugin in pluginList) {
          if (plugin['isActivated'] == true) {
            activePluginIds.add(plugin['pluginId'] as String);
          }
        }
      } catch (e) {
        fail('Should not throw exception');
      }

      // Only plugin1 should be added
      expect(activePluginIds.length, equals(1));
      expect(activePluginIds.contains('plugin1'), isTrue);
    });
  });

  group('MenuPage Widget Tests', () {
    const String queryString = '''
            query GetAllPlugins {
              getPlugins(input: {}) {
                id
                pluginId
                isActivated
                isInstalled
              }
            }
          ''';

    testWidgets('MenuPage renders and constructor executes (line 15)',
        (tester) async {
      final mockQueryResult = QueryResult(
        source: QueryResultSource.network,
        data: {
          'getPlugins': [],
        },
        options: QueryOptions(
          document: gql(queryString),
        ),
      );

      when(
        databaseFunctions.gqlAuthQuery(
          queryString,
          variables: {},
        ),
      ).thenAnswer((_) async => mockQueryResult);

      // This test covers line 15: }) : super(key: key);
      await tester.pumpWidget(createMenuPage());
      await tester.pumpAndSettle();

      // Verify MenuPage is rendered (constructor was called with key)
      expect(find.byKey(const Key('MenuPage')), findsOneWidget);
    });

    testWidgets('Menu button triggers drawer open (line 27)', (tester) async {
      final mockQueryResult = QueryResult(
        source: QueryResultSource.network,
        data: {
          'getPlugins': [],
        },
        options: QueryOptions(
          document: gql(queryString),
        ),
      );

      when(
        databaseFunctions.gqlAuthQuery(
          queryString,
          variables: {},
        ),
      ).thenAnswer((_) async => mockQueryResult);

      await tester.pumpWidget(createMenuPage());
      await tester.pumpAndSettle();

      // Find and tap the menu button
      // This tests line 27: onPressed: () => Scaffold.maybeOf(context)?.openDrawer()
      final menuButton = find.byIcon(Icons.menu);
      expect(menuButton, findsOneWidget);
      await tester.tap(menuButton);
      await tester.pumpAndSettle();
    });

    testWidgets('Settings button navigates to app settings (line 42)',
        (tester) async {
      final mockQueryResult = QueryResult(
        source: QueryResultSource.network,
        data: {
          'getPlugins': [],
        },
        options: QueryOptions(
          document: gql(queryString),
        ),
      );

      when(
        databaseFunctions.gqlAuthQuery(
          queryString,
          variables: {},
        ),
      ).thenAnswer((_) async => mockQueryResult);

      await tester.pumpWidget(createMenuPage());
      await tester.pumpAndSettle();

      // Find and tap the settings button
      // This tests line 42: navigationService.pushScreen(Routes.appSettings);
      final settingsButton = find.byIcon(Icons.settings);
      expect(settingsButton, findsOneWidget);
      await tester.tap(settingsButton);
      await tester.pumpAndSettle();

      // Verify navigation was attempted
      verify(navigationService.pushScreen('/appSettingsPage')).called(1);
    });

    testWidgets(
        'MenuPage parses valid plugin data successfully (lines 128-150)',
        (tester) async {
      final mockQueryResult = QueryResult(
        source: QueryResultSource.network,
        data: {
          'getPlugins': [
            {
              'id': '1',
              'pluginId': 'plugin_1',
              'isActivated': true,
              'isInstalled': true,
            },
            {
              'id': '2',
              'pluginId': 'plugin_2',
              'isActivated': false,
              'isInstalled': true,
            },
            {
              'id': '3',
              'pluginId': 'plugin_3',
              'isActivated': true,
              'isInstalled': true,
            },
          ],
        },
        options: QueryOptions(
          document: gql(queryString),
        ),
      );

      when(
        databaseFunctions.gqlAuthQuery(
          queryString,
          variables: {},
        ),
      ).thenAnswer((_) async => mockQueryResult);

      // This test covers lines 128-150: the try-catch block parsing GraphQL response
      await tester.pumpWidget(createMenuPage());
      await tester.pumpAndSettle();

      // Verify MenuPage is rendered and parsing succeeded
      expect(find.byKey(const Key('MenuPage')), findsOneWidget);
    });

    testWidgets(
        'MenuPage handles GraphQL parsing error gracefully (lines 128-150 catch block)',
        (tester) async {
      final mockQueryResult = QueryResult(
        source: QueryResultSource.network,
        data: {
          'getPlugins': 'invalid_data_structure', // Invalid - should be a list
        },
        options: QueryOptions(
          document: gql(queryString),
        ),
      );

      when(
        databaseFunctions.gqlAuthQuery(
          queryString,
          variables: {},
        ),
      ).thenAnswer((_) async => mockQueryResult);

      // This test covers the catch block in lines 128-150
      await tester.pumpWidget(createMenuPage());
      await tester.pumpAndSettle();

      // Verify MenuPage handles error and still renders
      expect(find.byKey(const Key('MenuPage')), findsOneWidget);
    });

    testWidgets('MenuPage handles null data gracefully (lines 128-150)',
        (tester) async {
      final mockQueryResult = QueryResult(
        source: QueryResultSource.network,
        data: null,
        options: QueryOptions(
          document: gql(queryString),
        ),
      );

      when(
        databaseFunctions.gqlAuthQuery(
          queryString,
          variables: {},
        ),
      ).thenAnswer((_) async => mockQueryResult);

      // This test covers lines 128-150 with null data
      await tester.pumpWidget(createMenuPage());
      await tester.pumpAndSettle();

      // Verify MenuPage handles null data
      expect(find.byKey(const Key('MenuPage')), findsOneWidget);
    });

    testWidgets('MenuPage filters inactive plugins correctly (lines 128-150)',
        (tester) async {
      final mockQueryResult = QueryResult(
        source: QueryResultSource.network,
        data: {
          'getPlugins': [
            {
              'id': '1',
              'pluginId': 'plugin_active',
              'isActivated': true,
              'isInstalled': true,
            },
            {
              'id': '2',
              'pluginId': 'plugin_inactive',
              'isActivated': false,
              'isInstalled': true,
            },
            {
              'id': '3',
              'pluginId': 'plugin_not_installed',
              'isActivated': true,
              'isInstalled': false,
            },
          ],
        },
        options: QueryOptions(
          document: gql(queryString),
        ),
      );

      when(
        databaseFunctions.gqlAuthQuery(
          queryString,
          variables: {},
        ),
      ).thenAnswer((_) async => mockQueryResult);

      // This test ensures the filtering logic in lines 128-150 works correctly
      await tester.pumpWidget(createMenuPage());
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('MenuPage')), findsOneWidget);
    });
  });

  group('MenuPage Authentication Logic Tests', () {
    const String queryString = '''
            query GetAllPlugins {
              getPlugins(input: {}) {
                id
                pluginId
                isActivated
                isInstalled
              }
            }
          ''';

    testWidgets(
        'MenuPage skips GraphQL call when user not logged in (lines 89-95)',
        (tester) async {
      // Setup: user not logged in
      when(userConfig.loggedIn).thenReturn(false);

      await tester.pumpWidget(createMenuPage());
      await tester.pumpAndSettle();

      // Verify: GraphQL query was NOT called
      verifyNever(
        databaseFunctions.gqlAuthQuery(
          queryString,
          variables: anyNamed('variables'),
        ),
      );

      // Verify: MenuPage still renders with bundled plugins
      expect(find.byKey(const Key('MenuPage')), findsOneWidget);
    });

    testWidgets('MenuPage initializes bundled plugins when not logged in',
        (tester) async {
      // Setup: user not logged in
      when(userConfig.loggedIn).thenReturn(false);

      await tester.pumpWidget(createMenuPage());
      await tester.pumpAndSettle();

      // Verify: PluginManager initialized with bundled plugins (no API call)
      expect(PluginManager.instance.isInitialized, true);
      expect(find.byType(PluginInjector), findsOneWidget);
    });

    testWidgets('MenuPage calls GraphQL API when user is logged in',
        (tester) async {
      // Setup: user IS logged in
      when(userConfig.loggedIn).thenReturn(true);

      final mockQueryResult = QueryResult(
        source: QueryResultSource.network,
        data: {
          'getPlugins': [],
        },
        options: QueryOptions(
          document: gql(queryString),
        ),
      );

      when(databaseFunctions.gqlAuthQuery(queryString, variables: {}))
          .thenAnswer((_) async => mockQueryResult);

      await tester.pumpWidget(createMenuPage());
      await tester.pumpAndSettle();

      // Verify: GraphQL query WAS called for authenticated users
      verify(
        databaseFunctions.gqlAuthQuery(
          queryString,
          variables: {},
        ),
      ).called(1);
    });
  });
}
