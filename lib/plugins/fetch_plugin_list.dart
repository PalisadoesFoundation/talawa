import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:talawa/locator.dart';

class FetchPluginList {
  FetchPluginList() {
    fetchList();
  }
  late Box box;

  ///fetches plugins from server and stores them in Hive `pluginBox`
  Future<void> fetchList() async {
    late final GraphQLClient client = graphqlConfig.clientToQuery();
    final QueryResult result = await client.query(QueryOptions(
      document: gql(queries.getPluginsList()),
    ));
    box = Hive.box('pluginBox');
    box.put('plugins', result.data!["getPlugins"]);
  }
}
