


# userLanguageQuery method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> userLanguageQuery
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) userId)





<p>This function perform graphQL query to check the user's language in the database.
The function uses <code>gqlAuthQuery</code> method provided by Database Functions Services.</p>
<p>params:</p>
<ul>
<li><code>userId</code> : user for which language need to be fetch.</li>
</ul>



## Implementation

```dart
Future<void> userLanguageQuery(String userId) async {
  try {
    await databaseFunctions.gqlAuthQuery(queries.newUserLanguage(userId));
  } catch (e) {
    print(e);
  }
}
```







