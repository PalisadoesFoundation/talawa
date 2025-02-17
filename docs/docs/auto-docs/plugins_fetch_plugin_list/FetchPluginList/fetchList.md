
<div>

# fetchList method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]




Fetches plugins from server and stores them in Hive `pluginBox`.

**params**: None

**returns**: None



## Implementation

``` language-dart
Future<void>  async {
  late final GraphQLClient client = graphqlConfig.;
  final QueryResult result = await client.query(
    QueryOptions(
      document: gql(queries.),
    ),
  );
  box = Hive.box('pluginBox');
  box.put('plugins', result.data?["getPlugins"]);
}
```







1.  [talawa](../../index.html)
2.  [fetch_plugin_list](../../plugins_fetch_plugin_list/)
3.  [FetchPluginList](../../plugins_fetch_plugin_list/FetchPluginList-class.html)
4.  fetchList method

##### FetchPluginList class







