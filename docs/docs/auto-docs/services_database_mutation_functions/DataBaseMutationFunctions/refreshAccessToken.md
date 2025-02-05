


# refreshAccessToken method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)> refreshAccessToken
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) refreshToken)





<p>This function is used to refresh the Authenication token to access the application.</p>
<p><strong>params</strong>:</p>
<ul>
<li><code>refreshToken</code>: Needed for authentication</li>
</ul>
<p><strong>returns</strong>:</p>
<ul>
<li><code>Future&lt;bool&gt;</code>: it returns Future of dynamic</li>
</ul>



## Implementation

```dart
Future<bool> refreshAccessToken(String refreshToken) async {
  // run the graphQL mutation
  final QueryResult result = await clientNonAuth.mutate(
    MutationOptions(
      document: gql(
        _query.refreshToken(refreshToken),
      ),
    ),
  );
  // if there is an error or exception in [result]
  if (result.hasException) {
    final exception = encounteredExceptionOrError(result.exception!);
    if (exception!) {
      refreshAccessToken(refreshToken);
    } else {
      navigationService.pop();
    }
  } else if (result.data != null && result.isConcrete) {
    userConfig.updateAccessToken(
      refreshToken: (result.data!['refreshToken']
              as Map<String, dynamic>)['refreshToken']
          .toString(),
      accessToken: (result.data!['refreshToken']
              as Map<String, dynamic>)['accessToken']
          .toString(),
    );
    databaseFunctions.init();
    return true;
  }
  return false;
}
```







