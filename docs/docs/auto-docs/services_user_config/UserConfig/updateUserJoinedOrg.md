
<div>

# updateUserJoinedOrg method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]
updateUserJoinedOrg(

1.  [[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../../models_organization_org_info/OrgInfo-class.html)]\>]]
    orgDetails]

)



Updates the user joined organization.

**params**:

-   `orgDetails`: details of the organization that user joined.

**returns**: None



## Implementation

``` language-dart
Future<void> updateUserJoinedOrg(List<OrgInfo> orgDetails) async {
  _currentUser!.updateJoinedOrg(orgDetails);
  ;
}
```







1.  [talawa](../../index.html)
2.  [user_config](../../services_user_config/)
3.  [UserConfig](../../services_user_config/UserConfig-class.html)
4.  updateUserJoinedOrg method

##### UserConfig class







