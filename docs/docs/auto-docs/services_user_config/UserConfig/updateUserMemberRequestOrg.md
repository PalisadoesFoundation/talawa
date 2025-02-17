
<div>

# updateUserMemberRequestOrg method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]
updateUserMemberRequestOrg(

1.  [[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../../models_organization_org_info/OrgInfo-class.html)]\>]]
    orgDetails]

)



Updates the user request to join the organization.

**params**:

-   `orgDetails`: details of the organization that user joined.

**returns**: None



## Implementation

``` language-dart
Future<void> updateUserMemberRequestOrg(List<OrgInfo> orgDetails) async {
  _currentUser!.updateMemberRequestOrg(orgDetails);
  ;
}
```







1.  [talawa](../../index.html)
2.  [user_config](../../services_user_config/)
3.  [UserConfig](../../services_user_config/UserConfig-class.html)
4.  updateUserMemberRequestOrg method

##### UserConfig class







