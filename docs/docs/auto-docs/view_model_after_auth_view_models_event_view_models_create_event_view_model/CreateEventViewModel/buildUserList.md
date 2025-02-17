
<div>

# buildUserList method

</div>


void 



This function build the user list.

**params**: None

**returns**: None



## Implementation

``` language-dart
void  {
  _selectedMembers.;

  // loop through the organization member list

  orgMembersList.forEach((orgMember) {
    if (_memberCheckedMap[orgMember.id] == true) {
      _selectedMembers.add(orgMember);
    }
  });
  ;
}
```







1.  [talawa](../../index.md)
2.  [create_event_view_model](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/)
3.  [CreateEventViewModel](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.md)
4.  buildUserList method

##### CreateEventViewModel class







