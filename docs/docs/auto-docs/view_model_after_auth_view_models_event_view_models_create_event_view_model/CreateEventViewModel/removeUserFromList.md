
<div>

# removeUserFromList method

</div>


void removeUserFromList({

1.  [required
    [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    userId, ]

})



This function is used to remove a user from user\'s list.

**params**:

-   `userId`: id of the user that need to be removed.

**returns**: None



## Implementation

``` language-dart
void removeUserFromList({required String userId}) {
  _selectedMembers.removeWhere((user) => user.id == userId);
  _memberCheckedMap[userId] = false;

  ;
}
```







1.  [talawa](../../index.html)
2.  [create_event_view_model](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/)
3.  [CreateEventViewModel](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.html)
4.  removeUserFromList method

##### CreateEventViewModel class







