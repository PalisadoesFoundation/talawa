


# gqlNonAuthQuery method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.4/graphql/QueryResult-class.html)&lt;[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?>?> gqlNonAuthQuery
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) query, {[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic>? variables})





<p>This function is used to run the graph-ql query for the non signed-in user.</p>
<p><strong>params</strong>:</p>
<ul>
<li><code>query</code>: query is used to fetch data in graphql, for more info read graphql docs</li>
<li><code>variables</code>: variables to be passed with query</li>
</ul>
<p><strong>returns</strong>:</p>
<ul>
<li><code>Future&lt;QueryResult&lt;Object?&gt;?&gt;</code>: it returns Future of QueryResult, contains all data</li>
</ul>



## Implementation

```dart
Future<QueryResult<Object?>?> gqlNonAuthQuery(
  String query, {
  Map<String, dynamic>? variables,
}) async {
  final queryOptions = QueryOptions(
    document: gql(query),
    variables: variables ?? <String, dynamic>{},
  );
  final result = await clientNonAuth.query(queryOptions);
  QueryResult? finalRes;
  // if there is an error or exception in [result]
  if (result.hasException) {
    final exception = encounteredExceptionOrError(result.exception!);
    if (exception!) {
      finalRes = await gqlNonAuthQuery(query, variables: variables);
    }
  } else if (result.data != null && result.isConcrete) {
    return result;
  }
  return finalRes;
}
```







