


# updateUserCreatedOrg method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html) updateUserCreatedOrg
([List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[OrgInfo](../../models_organization_org_info/OrgInfo-class.md)> orgDetails)





<p>This function is used to update the user created organization.</p>
<p>params:</p>
<ul>
<li><code>orgDetails</code> : details of the organization that user created.</li>
</ul>



## Implementation

```dart
Future updateUserCreatedOrg(List<OrgInfo> orgDetails) async {
  _currentUser!.updateCreatedOrg(orgDetails);
  saveUserInHive();
}
```







