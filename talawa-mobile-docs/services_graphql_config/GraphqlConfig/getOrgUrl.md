


# getOrgUrl method








void getOrgUrl
()





<p>This function is used to get the organization URL.</p>



## Implementation

```dart
void getOrgUrl() {
  final box = Hive.box('url');
  final String? url = box.get(urlKey) as String?;
  final String? imgUrl = box.get(imageUrlKey) as String?;
  orgURI = url ?? ' ';
  displayImgRoute = imgUrl ?? ' ';
  httpLink = HttpLink(orgURI!);
  clientToQuery();
  authClient();
}
```







