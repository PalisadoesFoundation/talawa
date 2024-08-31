import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/plugins/fetch_plugin_list.dart';
import 'package:talawa/services/graphql_config.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

/// Tests fetch_plugin_list.dart.
///
/// more_info_if_required
///
/// **params**:
///   None
///
/// **returns**:
///   None
void main() async {
  late FetchPluginList fetchPluginList;
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    locator<GraphqlConfig>().test();
    registerServices();
    locator.allowReassignment = true;

    locator.registerLazySingleton<FetchPluginList>(() => FetchPluginList());
    fetchPluginList = locator<FetchPluginList>();
  });
  group('FetchPluginList', () {
    test('fetchList should fetch plugins and store them in Hive', () async {
      final queryResult = QueryResult(
        data: {
          'getPlugins': [
            {
              '_id': '1',
              'pluginName': 'Plugin 1',
              'pluginCreatedBy': 'User A',
              'pluginDesc': 'Description A',
              'pluginInstallStatus': true,
              'installedOrgs': ['Org A'],
            },
          ],
        },
        options: QueryOptions(
          document: gql(queries.getPluginsList()),
        ),
        source: QueryResultSource.network,
      );

      when(locator<GraphqlConfig>().clientToQuery()).thenAnswer(
        (_) => locator<GraphQLClient>(),
      );
      when(
        locator<GraphQLClient>().query(
          QueryOptions(
            document: gql(queries.getPluginsList()),
          ),
        ),
      ).thenAnswer((_) async => queryResult);
      await fetchPluginList.fetchList();

      verify(locator<GraphqlConfig>().clientToQuery()).called(2);
      verify(
        locator<GraphQLClient>().query(
          QueryOptions(
            document: gql(queries.getPluginsList()),
          ),
        ),
      ).called(2);

      expect(fetchPluginList.box, isNotNull);
      expect(
        fetchPluginList.box.get('plugins'),
        equals(queryResult.data!["getPlugins"]),
      );
    });
  });
}
