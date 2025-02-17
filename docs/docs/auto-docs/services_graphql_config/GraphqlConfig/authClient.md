
<div>

# authClient method

</div>


[[GraphQLClient](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/GraphQLClient-class.html)]




## Implementation

``` language-dart
GraphQLClient  {
  final AuthLink authLink = AuthLink(getToken: () async => 'Bearer $token');
  final Link finalAuthLink = authLink.concat(httpLink);
  return GraphQLClient(
    cache: GraphQLCache(partialDataPolicy: PartialDataCachePolicy.accept),
    link: finalAuthLink,
  );
}
```







1.  [talawa](../../index.html)
2.  [graphql_config](../../services_graphql_config/)
3.  [GraphqlConfig](../../services_graphql_config/GraphqlConfig-class.html)
4.  authClient method

##### GraphqlConfig class







