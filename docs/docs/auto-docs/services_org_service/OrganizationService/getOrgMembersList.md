
<div>

# getOrgMembersList method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[User](../../models_user_user_info/User-class.md)]\>]]\>]]
getOrgMembersList(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    orgId]

)



Retrieves a list of organization members.

**params**:

-   `orgId`: The ID of the organization to fetch members from.

**returns**:

-   `Future<List<User>>`: A promise that will be fulfilled with the list
    of organization members.



## Implementation

``` language-dart
Future<List<User>> getOrgMembersList(String orgId) async 
```







1.  [talawa](../../index.md)
2.  [org_service](../../services_org_service/)
3.  [OrganizationService](../../services_org_service/OrganizationService-class.md)
4.  getOrgMembersList method

##### OrganizationService class







