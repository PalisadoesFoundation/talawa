


# updateUserAdminOrg method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html) updateUserAdminOrg
([List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[OrgInfo](../../models_organization_org_info/OrgInfo-class.md)> orgDetails)





<p>This function is used to update the organization admin.</p>
<p>params:</p>
<ul>
<li><code>orgDetails</code> : details of the organization.</li>
</ul>



## Implementation

```dart
Future updateUserAdminOrg(List<OrgInfo> orgDetails) async {
  _currentUser!.updateAdminFor(orgDetails);
  saveUserInHive();
}
```







