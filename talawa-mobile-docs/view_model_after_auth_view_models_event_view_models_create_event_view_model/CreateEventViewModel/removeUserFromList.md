


# removeUserFromList method








void removeUserFromList
({required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) userId})





<p>This function is used to remove a user from user's list.</p>
<p><strong>params</strong>:</p>
<ul>
<li><code>userId</code>: id of the user that need to be removed.</li>
</ul>
<p><strong>returns</strong>:
  None</p>



## Implementation

```dart
void removeUserFromList({required String userId}) {
  _selectedMembers.removeWhere((user) => user.id == userId);
  _memberCheckedMap[userId] = false;

  notifyListeners();
}
```







