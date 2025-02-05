


# getCurrentOrgUsersList method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;[List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[User](../../models_user_user_info/User-class.md)>> getCurrentOrgUsersList
()





<p>This function fetch all the users in the current organization and return <code>List</code>.</p>
<p><strong>params</strong>:
  None</p>
<p><strong>returns</strong>:</p>
<ul>
<li><code>Future&lt;List&lt;User&gt;&gt;</code>: Current Organization Users List</li>
</ul>



## Implementation

```dart
Future<List<User>> getCurrentOrgUsersList() async {
  if (orgMembersList.isEmpty) {
    orgMembersList = await organizationService
        .getOrgMembersList(userConfig.currentOrg.id!);
  }

  // loop through list
  orgMembersList.forEach((orgMember) {
    _memberCheckedMap.putIfAbsent(orgMember.id!, () => false);
    _memberCheckedMap.putIfAbsent(orgMember.id!, () => false);
  });
  // return list
  return orgMembersList;
}
```







