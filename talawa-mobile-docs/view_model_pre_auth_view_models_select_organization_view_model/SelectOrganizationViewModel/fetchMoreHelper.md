


# fetchMoreHelper method








void fetchMoreHelper
([FetchMore](https://pub.dev/documentation/graphql_flutter/5.2.0-beta.5/graphql_flutter/FetchMore.html)&lt;[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?> fetchMore, [List](https://api.flutter.dev/flutter/dart-core/List-class.html) organizations)





<p>This function fetch more option.</p>



## Implementation

```dart
void fetchMoreHelper(FetchMore fetchMore, List organizations) {
  fetchMore(
    FetchMoreOptions(
      variables: {
        "first": organizations.length + 15,
        "skip": organizations.length,
      },
      updateQuery: (existingOrganizations, newOrganizations) {
        return {
          'organizationsConnection': [
            ...existingOrganizations!["organizationsConnection"],
            ...newOrganizations!['organizationsConnection'],
          ],
        };
      },
    ),
  );
}
```







