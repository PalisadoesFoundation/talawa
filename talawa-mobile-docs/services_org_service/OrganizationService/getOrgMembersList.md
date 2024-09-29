


# getOrgMembersList method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;[List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[User](../../models_user_user_info/User-class.md)>> getOrgMembersList
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) orgId)





<p>This function fetch and returns the list of organization members.</p>
<p>params:</p>
<ul>
<li><code>orgId</code> : id of the organization for which members list need be fetched.</li>
</ul>



## Implementation

```dart
Future<List<User>> getOrgMembersList(String orgId) async {
  final String query = Queries().fetchOrgDetailsById(orgId);
  // fetching from database using graphQL mutations.
  final result = await _dbFunctions.gqlAuthMutation(query);
  final List orgMembersResult =
      result.data['organizations'][0]['members'] as List;
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







