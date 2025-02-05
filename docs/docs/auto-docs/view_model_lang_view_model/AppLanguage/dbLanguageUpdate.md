


# dbLanguageUpdate method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> dbLanguageUpdate
()





<p>This function updates the Database Language by running the graphQL <code>mutations</code>.</p>



## Implementation

```dart
Future<void> dbLanguageUpdate() async {
  try {
    await databaseFunctions
        .gqlAuthMutation(queries.updateLanguage(_appLocale.languageCode));
    print('Language Updated in Database');
  } catch (e) {
    print(e);
  }
}
```







