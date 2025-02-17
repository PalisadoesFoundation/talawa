
<div>

# clientToQuery method

</div>


[[GraphQLClient](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/GraphQLClient-class.html)]




## Implementation

``` language-dart
GraphQLClient  {
  //TODO: Implement websocket link from OrgUrl
  // final link = Link.split(
  //     (request) => request.isSubscription, webSocketLink, httpLink);
  return GraphQLClient(
    cache: GraphQLCache(partialDataPolicy: PartialDataCachePolicy.accept),
    link: httpLink,
  );
}
```







1.  [talawa](../../index.html)
2.  [graphql_config](../../services_graphql_config/)
3.  [GraphqlConfig](../../services_graphql_config/GraphqlConfig-class.html)
4.  clientToQuery method

##### GraphqlConfig class







