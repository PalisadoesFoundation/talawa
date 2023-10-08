


# updateMemberRequestOrg method








void updateMemberRequestOrg
([List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[OrgInfo](../../models_organization_org_info/OrgInfo-class.md)> orgList)








## Implementation

```dart
void updateMemberRequestOrg(List<OrgInfo> orgList) {
  this.membershipRequests = [...membershipRequests!, ...orgList];
}
```







