import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:talawa/locator.dart';

/// This class fetch plugins list.
class FetchPluginList {
  /// Constructor of the class.
  FetchPluginList() {
    fetchList();
  }

  /// late initialize the box.
  late Box box;

  /// Fetches plugins from server and stores them in Hive `pluginBox`.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Future<void>`: it returns Future of void
  Future<void> fetchList() async {
    late final GraphQLClient client = graphqlConfig.clientToQuery();
    final QueryResult result = await client.query(
      QueryOptions(
        document: gql(queries.getPluginsList()),
      ),
    );
    box = Hive.box('pluginBox');
    box.put('plugins', result.data!["getPlugins"]);
  }
}
