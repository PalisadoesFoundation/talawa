


# authClient method








[GraphQLClient](https://pub.dev/documentation/graphql/5.2.0-beta.4/graphql/GraphQLClient-class.html) authClient
()








## Implementation

```dart
GraphQLClient authClient() {
  final AuthLink authLink = AuthLink(getToken: () async => 'Bearer $token');
  final Link finalAuthLink = authLink.concat(httpLink);
  return GraphQLClient(
    cache: GraphQLCache(partialDataPolicy: PartialDataCachePolicy.accept),
    link: finalAuthLink,
  );
}
```







