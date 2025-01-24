




getToken method - GraphqlConfig class - graphql\_config library - Dart API







menu

1. [talawa](../../index.html)
2. [services/graphql\_config.dart](../../services_graphql_config/services_graphql_config-library.html)
3. [GraphqlConfig](../../services_graphql_config/GraphqlConfig-class.html)
4. getToken method

getToken


dark\_mode

light\_mode




# getToken method


Future
getToken()

This function is used to get user the access token.


## Implementation

```
Future getToken() async {
  final authToken = userConfig.currentUser.authToken;
  token = authToken;
  getOrgUrl();
  return true;
}
```

 


1. [talawa](../../index.html)
2. [graphql\_config](../../services_graphql_config/services_graphql_config-library.html)
3. [GraphqlConfig](../../services_graphql_config/GraphqlConfig-class.html)
4. getToken method

##### GraphqlConfig class





talawa
1.0.0+1






