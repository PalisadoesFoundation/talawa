




authClient method - GraphqlConfig class - graphql\_config library - Dart API







menu

1. [talawa](../../index.html)
2. [services/graphql\_config.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_graphql_config/)
3. [GraphqlConfig](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_graphql_config/GraphqlConfig-class.html)
4. authClient method

authClient


dark\_mode

light\_mode




# authClient method


dynamic
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
2. [graphql\_config](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_graphql_config/)
3. [GraphqlConfig](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_graphql_config/GraphqlConfig-class.html)
4. authClient method

##### GraphqlConfig class





talawa
1.0.0+1






