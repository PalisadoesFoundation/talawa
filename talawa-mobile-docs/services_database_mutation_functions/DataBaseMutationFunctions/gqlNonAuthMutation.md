


# gqlNonAuthMutation method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html) gqlNonAuthMutation
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) mutation, {[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic>? variables, [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) reCall = true})





<p>This function is used to run the graph-ql mutation to authenticate the non signed-in user.</p>
<p><strong>params</strong>:</p>
<ul>
<li><code>mutation</code>: mutation is used to change/add/delete data in graphql, for more info read graphql docs</li>
<li><code>variables</code>: variables to be passed with mutation</li>
<li><code>reCall</code>: when not first fetch call</li>
</ul>
<p><strong>returns</strong>:</p>
<ul>
<li><code>Future&lt;dynamic&gt;</code>: it returns Future of dynamic</li>
</ul>



## Implementation

```dart
Future<dynamic> gqlNonAuthMutation(
  String mutation, {
  Map<String, dynamic>? variables,
  bool reCall = true,
}) async {
  final QueryResult result = await clientNonAuth.mutate(
    MutationOptions(
      document: gql(mutation),
      variables: variables ?? <String, dynamic>{},
    ),
  );
  // if there is an error or exception in [result]
  if (result.hasException) {
    final exception = encounteredExceptionOrError(result.exception!);
    if (exception! && reCall) {
      gqlNonAuthMutation(mutation, variables: variables);
    }
  } else if (result.data != null && result.isConcrete) {
    return result;
  }
  return null;
}
```







