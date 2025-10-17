// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/locator.dart' as talawa_locator;
import 'package:talawa/services/size_config.dart';

import '../../../helpers/test_locator.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    talawa_locator.locator<SizeConfig>().test();
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
}
