




getOrgUrl method - GraphqlConfig class - graphql\_config library - Dart API







menu

1. [talawa](../../index.html)
2. [services/graphql\_config.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_graphql_config/)
3. [GraphqlConfig](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_graphql_config/GraphqlConfig-class.html)
4. getOrgUrl method

getOrgUrl


dark\_mode

light\_mode




# getOrgUrl method


void
getOrgUrl()

This function is used to get the organization URL.


## Implementation

```
void getOrgUrl() {
  final box = Hive.box('url');
  final String? url = box.get(urlKey) as String?;
  final String? imgUrl = box.get(imageUrlKey) as String?;
  orgURI = url ?? ' ';
  displayImgRoute = imgUrl ?? ' ';
  httpLink = HttpLink(orgURI!);
}
```

 


1. [talawa](../../index.html)
2. [graphql\_config](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_graphql_config/)
3. [GraphqlConfig](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_graphql_config/GraphqlConfig-class.html)
4. getOrgUrl method

##### GraphqlConfig class





talawa
1.0.0+1






