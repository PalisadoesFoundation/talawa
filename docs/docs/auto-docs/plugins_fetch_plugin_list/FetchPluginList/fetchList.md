




fetchList method - FetchPluginList class - fetch\_plugin\_list library - Dart API







menu

1. [talawa](../../index.html)
2. [plugins/fetch\_plugin\_list.dart](../../plugins_fetch_plugin_list/plugins_fetch_plugin_list-library.html)
3. [FetchPluginList](../../plugins_fetch_plugin_list/FetchPluginList-class.html)
4. fetchList method

fetchList


dark\_mode

light\_mode




# fetchList method


Future<void>
fetchList()

Fetches plugins from server and stores them in Hive `pluginBox`.

**params**:
None

**returns**:
None


## Implementation

```
Future<void> fetchList() async {
  late final GraphQLClient client = graphqlConfig.clientToQuery();
  final QueryResult result = await client.query(
    QueryOptions(
      document: gql(queries.getPluginsList()),
    ),
  );
  box = Hive.box('pluginBox');
  box.put('plugins', result.data?["getPlugins"]);
}
```

 


1. [talawa](../../index.html)
2. [fetch\_plugin\_list](../../plugins_fetch_plugin_list/plugins_fetch_plugin_list-library.html)
3. [FetchPluginList](../../plugins_fetch_plugin_list/FetchPluginList-class.html)
4. fetchList method

##### FetchPluginList class





talawa
1.0.0+1






