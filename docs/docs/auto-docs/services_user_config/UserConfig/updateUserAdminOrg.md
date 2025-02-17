
<div>

# updateUserAdminOrg method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]
updateUserAdminOrg(

1.  [[[List](https://api.flutter.dev/flutter/dart-core/List-class.md)[\<[[OrgInfo](../../models_organization_org_info/OrgInfo-class.md)]\>]]
    orgDetails]

)



Updates the organization admin.

**params**:

-   `orgDetails`: details of the organization that user joined.

**returns**: None



## Implementation

``` language-dart
Future<void> updateUserAdminOrg(List<OrgInfo> orgDetails) async {
  _currentUser!.updateAdminFor(orgDetails);
  ;
}
```







1.  [talawa](../../index.md)
2.  [user_config](../../services_user_config/)
3.  [UserConfig](../../services_user_config/UserConfig-class.md)
4.  updateUserAdminOrg method

##### UserConfig class







