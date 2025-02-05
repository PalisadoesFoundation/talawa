


# updateUserJoinedOrg method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html) updateUserJoinedOrg
([List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[OrgInfo](../../models_organization_org_info/OrgInfo-class.md)> orgDetails)





<p>This function is used to update the user joined organization.</p>
<p>params:</p>
<ul>
<li><code>orgDetails</code> : details of the organization that user joined.</li>
</ul>



## Implementation

```dart
Future updateUserJoinedOrg(List<OrgInfo> orgDetails) async {
  _currentUser!.updateJoinedOrg(orgDetails);
  saveUserInHive();
}
```







