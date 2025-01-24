




getOrgMembersList method - OrganizationService class - org\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/org\_service.dart](../../services_org_service/services_org_service-library.html)
3. [OrganizationService](../../services_org_service/OrganizationService-class.html)
4. getOrgMembersList method

getOrgMembersList


dark\_mode

light\_mode




# getOrgMembersList method


Future<List<[User](../../models_user_user_info/User-class.html)>>
getOrgMembersList(

1. String orgId

)

Retrieves a list of organization members.

**params**:

* `orgId`: The ID of the organization to fetch members from.

**returns**:

* `Future<List<User>>`: A promise that will be fulfilled
  with the list of organization members.

## Implementation

```
Future<List<User>> getOrgMembersList(String orgId) async {
  final String query = Queries().fetchOrgDetailsById(orgId);
  // fetching from database using graphQL mutations.
  final result = await _dbFunctions.gqlAuthMutation(query);
  final organizations = result.data?['organizations'] as List;
  final List orgMembersResult =
      (organizations[0] as Map<String, dynamic>)['members'] as List;
  final List<User> orgMembersList = [];
  orgMembersResult.forEach((jsonElement) {
    final User member =
        User.fromJson(jsonElement as Map<String, dynamic>, fromOrg: true);
    orgMembersList.add(member);
  });

  // return list
  return orgMembersList;
}
```

 


1. [talawa](../../index.html)
2. [org\_service](../../services_org_service/services_org_service-library.html)
3. [OrganizationService](../../services_org_service/OrganizationService-class.html)
4. getOrgMembersList method

##### OrganizationService class





talawa
1.0.0+1






