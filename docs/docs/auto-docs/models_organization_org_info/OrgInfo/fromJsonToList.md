


# fromJsonToList method








[List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[OrgInfo](../../models_organization_org_info/OrgInfo-class.md)> fromJsonToList
([List](https://api.flutter.dev/flutter/dart-core/List-class.html) json)








## Implementation

```dart
List<OrgInfo> fromJsonToList(List<dynamic> json) {
  final List<OrgInfo> orgList = [];
  json.forEach((element) {
    final OrgInfo org = OrgInfo.fromJson(element as Map<String, dynamic>);
    orgList.add(org);
  });
  return orgList;
}
```







