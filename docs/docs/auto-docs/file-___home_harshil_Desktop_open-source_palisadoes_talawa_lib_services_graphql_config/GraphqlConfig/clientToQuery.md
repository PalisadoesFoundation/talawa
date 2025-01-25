




clientToQuery method - GraphqlConfig class - graphql\_config library - Dart API







menu

1. [talawa](../../index.html)
2. [services/graphql\_config.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_graphql_config/)
3. [GraphqlConfig](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_graphql_config/GraphqlConfig-class.html)
4. clientToQuery method

clientToQuery


dark\_mode

light\_mode




# clientToQuery method


dynamic
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
2. [graphql\_config](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_graphql_config/)
3. [GraphqlConfig](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_graphql_config/GraphqlConfig-class.html)
4. clientToQuery method

##### GraphqlConfig class





talawa
1.0.0+1






