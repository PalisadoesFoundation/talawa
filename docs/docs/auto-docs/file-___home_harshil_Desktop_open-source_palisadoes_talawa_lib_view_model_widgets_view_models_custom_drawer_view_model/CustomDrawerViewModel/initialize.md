




initialize method - CustomDrawerViewModel class - custom\_drawer\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/widgets\_view\_models/custom\_drawer\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_custom_drawer_view_model/)
3. [CustomDrawerViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class.html)
4. initialize method

initialize


dark\_mode

light\_mode




# initialize method


void
initialize(

1. dynamic homeModel,
2. dynamic context

)

initializer.

**params**:

* `homeModel`: instance of MainScreenViewModel.
* `context`: instance of BuildContext.

**returns**:
None


## Implementation

```
void initialize(MainScreenViewModel homeModel, BuildContext context) {
  _currentOrganizationStreamSubscription =
      userConfig.currentOrgInfoStream.listen(
    (updatedOrganization) {
      setSelectedOrganizationName(updatedOrganization);
    },
  );
  _currentUser = userConfig.currentUser;
  _selectedOrg = userConfig.currentOrg;
  _switchAbleOrg = _currentUser.joinedOrganizations ?? [];
}
```

 


1. [talawa](../../index.html)
2. [custom\_drawer\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_custom_drawer_view_model/)
3. [CustomDrawerViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class.html)
4. initialize method

##### CustomDrawerViewModel class





talawa
1.0.0+1






