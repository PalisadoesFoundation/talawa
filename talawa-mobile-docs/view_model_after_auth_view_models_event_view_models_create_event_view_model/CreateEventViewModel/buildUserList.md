


# buildUserList method








void buildUserList
()





<p>This function build the user list.</p>
<p><strong>params</strong>:
  None</p>
<p><strong>returns</strong>:
  None</p>



## Implementation

```dart
void buildUserList() {
  _selectedMembers.clear();

  // loop through the organization member list

  orgMembersList.forEach((orgMember) {
    if (_memberCheckedMap[orgMember.id] == true) {
      _selectedMembers.add(orgMember);
    }
  });
  notifyListeners();
}
```







