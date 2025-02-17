
<div>

# updateMemberRequestOrg method

</div>


void updateMemberRequestOrg(

1.  [[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../../models_organization_org_info/OrgInfo-class.html)]\>]]
    orgList]

)



Method to update membershipRequests List.

**params**:

-   `orgList`: List of organisations user have sent membership request.

**returns**: None



## Implementation

``` language-dart
void updateMemberRequestOrg(List<OrgInfo> orgList) {
  this.membershipRequests = [...membershipRequests!, ...orgList];
}
```







1.  [talawa](../../index.html)
2.  [user_info](../../models_user_user_info/)
3.  [User](../../models_user_user_info/User-class.html)
4.  updateMemberRequestOrg method

##### User class







