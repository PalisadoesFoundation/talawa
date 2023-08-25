


# fetchList method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> fetchList
()





<p>Fetches plugins from server and stores them in Hive <code>pluginBox</code>.</p>
<p><strong>params</strong>:
  None</p>
<p><strong>returns</strong>:</p>
<ul>
<li><code>Future&lt;void&gt;</code>: it returns Future of void</li>
</ul>



## Implementation

```dart
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
```







