


# fetchList method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> fetchList
()





<p>Fetches plugins from server and stores them in Hive ```dartpluginBox```.</p>
<p><strong>params</strong>:
  None</p>
<p><strong>returns</strong>:</p>
<ul>
<li>```dartFuture&lt;void&gt;```: it returns Future of void</li>
</ul>



## Implementation

```dart
Future<void> fetchList() async \{
  late final GraphQLClient client = graphqlConfig.clientToQuery();
  final QueryResult result = await client.query(
    QueryOptions(
      document: gql(queries.getPluginsList()),
    ),
  );
  box = Hive.box('pluginBox');
  box.put('plugins', result.data!["getPlugins"]);
\}
```







