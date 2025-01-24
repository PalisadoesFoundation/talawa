




authClient method - GraphqlConfig class - graphql\_config library - Dart API







menu

1. [talawa](../../index.html)
2. [services/graphql\_config.dart](../../services_graphql_config/services_graphql_config-library.html)
3. [GraphqlConfig](../../services_graphql_config/GraphqlConfig-class.html)
4. authClient method

authClient


dark\_mode

light\_mode




# authClient method


[GraphQLClient](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/GraphQLClient-class.html)
authClient()

## Implementation

```
GraphQLClient authClient() {
  final AuthLink authLink = AuthLink(getToken: () async => 'Bearer $token');
  final Link finalAuthLink = authLink.concat(httpLink);
  return GraphQLClient(
    cache: GraphQLCache(partialDataPolicy: PartialDataCachePolicy.accept),
    link: finalAuthLink,
  );
}
```

 


1. [talawa](../../index.html)
2. [graphql\_config](../../services_graphql_config/services_graphql_config-library.html)
3. [GraphqlConfig](../../services_graphql_config/GraphqlConfig-class.html)
4. authClient method

##### GraphqlConfig class





talawa
1.0.0+1






