


# gqlAuthQuery method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html) gqlAuthQuery
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) query, {[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic>? variables})





<p>This function is used to run the graph-ql query for authentication.</p>
<p><strong>params</strong>:</p>
<ul>
<li><code>query</code>: query is used to fetch data in graphql, for more info read graphql docs</li>
<li><code>variables</code>: variables to be passed with query</li>
</ul>
<p><strong>returns</strong>:</p>
<ul>
<li><code>Future&lt;dynamic&gt;</code>: it returns Future of dynamic</li>
</ul>



## Implementation

```dart
Future<dynamic> gqlAuthQuery(
  String query, {
  Map<String, dynamic>? variables,
}) async {
  final QueryOptions options = QueryOptions(
    document: gql(query),
    variables: variables ?? <String, dynamic>{},
  );
  final QueryResult result = await clientAuth.query(options);
  // if there is an error or exception in [result]
  if (result.hasException) {
    final exception = encounteredExceptionOrError(result.exception!);
    if (exception!) {
      gqlAuthQuery(query, variables: variables);
    }
  } else if (result.data != null && result.isConcrete) {
    return result;
  }
  return null;
}
```







