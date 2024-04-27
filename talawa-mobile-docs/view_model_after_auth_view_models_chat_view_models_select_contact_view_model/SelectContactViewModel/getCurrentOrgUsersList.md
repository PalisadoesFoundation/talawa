


# getCurrentOrgUsersList method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> getCurrentOrgUsersList
()





<p>This function is used to get all users list of an current organization.</p>



## Implementation

```dart
Future<void> getCurrentOrgUsersList() async {
  if (orgMembersList.isEmpty) {
    orgMembersList = await _organizationService
        .getOrgMembersList(userConfig.currentOrg.id!);
  }

  //return orgMembersList;
}
```







