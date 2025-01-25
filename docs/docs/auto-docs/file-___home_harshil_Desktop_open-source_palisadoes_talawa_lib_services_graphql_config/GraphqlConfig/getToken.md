




getToken method - GraphqlConfig class - graphql\_config library - Dart API







menu

1. [talawa](../../index.html)
2. [services/graphql\_config.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_graphql_config/)
3. [GraphqlConfig](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_graphql_config/GraphqlConfig-class.html)
4. getToken method

getToken


dark\_mode

light\_mode




# getToken method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)
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
2. [graphql\_config](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_graphql_config/)
3. [GraphqlConfig](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_graphql_config/GraphqlConfig-class.html)
4. getToken method

##### GraphqlConfig class





talawa
1.0.0+1






