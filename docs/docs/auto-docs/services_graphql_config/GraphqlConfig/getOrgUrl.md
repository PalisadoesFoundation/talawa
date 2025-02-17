
<div>

# getOrgUrl method

</div>


void 



This function is used to get the organization URL.



## Implementation

``` language-dart
void  {
  final box = Hive.box('url');
  final String? url = box.get(urlKey) as String?;
  final String? imgUrl = box.get(imageUrlKey) as String?;
  orgURI = url ?? ' ';
  displayImgRoute = imgUrl ?? ' ';
  httpLink = HttpLink(orgURI!);
}
```







1.  [talawa](../../index.html)
2.  [graphql_config](../../services_graphql_config/)
3.  [GraphqlConfig](../../services_graphql_config/GraphqlConfig-class.html)
4.  getOrgUrl method

##### GraphqlConfig class







