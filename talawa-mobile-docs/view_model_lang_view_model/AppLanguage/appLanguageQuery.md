


# appLanguageQuery method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> appLanguageQuery
()





<p>This function perform graphQL query to check the app language.
The function uses <code>gqlAuthQuery</code> method provided by Database Functions Services.</p>



## Implementation

```dart
Future<void> appLanguageQuery() async {
  try {
    await databaseFunctions.gqlAuthQuery(queries.userLanguage());
  } catch (e) {
    print(e);
  }
}
```







