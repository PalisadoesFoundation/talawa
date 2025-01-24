




clientToQuery method - GraphqlConfig class - graphql\_config library - Dart API







menu

1. [talawa](../../index.html)
2. [services/graphql\_config.dart](../../services_graphql_config/services_graphql_config-library.html)
3. [GraphqlConfig](../../services_graphql_config/GraphqlConfig-class.html)
4. clientToQuery method

clientToQuery


dark\_mode

light\_mode




# clientToQuery method


[GraphQLClient](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/GraphQLClient-class.html)
clientToQuery()

## Implementation

```
GraphQLClient clientToQuery() {
  //TODO: Implement websocket link from OrgUrl
  // final link = Link.split(
  //     (request) => request.isSubscription, webSocketLink, httpLink);
  return GraphQLClient(
    cache: GraphQLCache(partialDataPolicy: PartialDataCachePolicy.accept),
    link: httpLink,
  );
}
```

 


1. [talawa](../../index.html)
2. [graphql\_config](../../services_graphql_config/services_graphql_config-library.html)
3. [GraphqlConfig](../../services_graphql_config/GraphqlConfig-class.html)
4. clientToQuery method

##### GraphqlConfig class





talawa
1.0.0+1






