




initialize method - CustomDrawerViewModel class - custom\_drawer\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/widgets\_view\_models/custom\_drawer\_view\_model.dart](../../view_model_widgets_view_models_custom_drawer_view_model/view_model_widgets_view_models_custom_drawer_view_model-library.html)
3. [CustomDrawerViewModel](../../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class.html)
4. initialize method

initialize


dark\_mode

light\_mode




# initialize method


void
initialize(

1. [MainScreenViewModel](../../view_model_main_screen_view_model/MainScreenViewModel-class.html) homeModel,
2. [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context

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
2. [custom\_drawer\_view\_model](../../view_model_widgets_view_models_custom_drawer_view_model/view_model_widgets_view_models_custom_drawer_view_model-library.html)
3. [CustomDrawerViewModel](../../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class.html)
4. initialize method

##### CustomDrawerViewModel class





talawa
1.0.0+1






