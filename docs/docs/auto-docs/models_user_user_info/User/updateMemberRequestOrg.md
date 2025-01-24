




updateMemberRequestOrg method - User class - user\_info library - Dart API







menu

1. [talawa](../../index.html)
2. [models/user/user\_info.dart](../../models_user_user_info/models_user_user_info-library.html)
3. [User](../../models_user_user_info/User-class.html)
4. updateMemberRequestOrg method

updateMemberRequestOrg


dark\_mode

light\_mode




# updateMemberRequestOrg method


void
updateMemberRequestOrg(

1. List<[OrgInfo](../../models_organization_org_info/OrgInfo-class.html)> orgList

)

Method to update membershipRequests List.

**params**:

* `orgList`: List of organisations user have sent membership request.

**returns**:
None


## Implementation

```
void updateMemberRequestOrg(List<OrgInfo> orgList) {
  this.membershipRequests = [...membershipRequests!, ...orgList];
}
```

 


1. [talawa](../../index.html)
2. [user\_info](../../models_user_user_info/models_user_user_info-library.html)
3. [User](../../models_user_user_info/User-class.html)
4. updateMemberRequestOrg method

##### User class





talawa
1.0.0+1






