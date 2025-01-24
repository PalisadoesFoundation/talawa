




removeUserFromList method - CreateEventViewModel class - create\_event\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/create\_event\_view\_model.dart](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/view_model_after_auth_view_models_event_view_models_create_event_view_model-library.html)
3. [CreateEventViewModel](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.html)
4. removeUserFromList method

removeUserFromList


dark\_mode

light\_mode




# removeUserFromList method


void
removeUserFromList({

1. required String userId,

})

This function is used to remove a user from user's list.

**params**:

* `userId`: id of the user that need to be removed.

**returns**:
None


## Implementation

```
void removeUserFromList({required String userId}) {
  _selectedMembers.removeWhere((user) => user.id == userId);
  _memberCheckedMap[userId] = false;

  notifyListeners();
}
```

 


1. [talawa](../../index.html)
2. [create\_event\_view\_model](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/view_model_after_auth_view_models_event_view_models_create_event_view_model-library.html)
3. [CreateEventViewModel](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.html)
4. removeUserFromList method

##### CreateEventViewModel class





talawa
1.0.0+1






