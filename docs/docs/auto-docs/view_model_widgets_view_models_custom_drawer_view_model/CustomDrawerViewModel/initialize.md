
<div>

# initialize method

</div>


void initialize(

1.  [[[MainScreenViewModel](../../view_model_main_screen_view_model/MainScreenViewModel-class.html)]
    homeModel, ]
2.  [[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]
    context]

)



initializer.

**params**:

-   `homeModel`: instance of MainScreenViewModel.
-   `context`: instance of BuildContext.

**returns**: None



## Implementation

``` language-dart
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







1.  [talawa](../../index.html)
2.  [custom_drawer_view_model](../../view_model_widgets_view_models_custom_drawer_view_model/)
3.  [CustomDrawerViewModel](../../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class.html)
4.  initialize method

##### CustomDrawerViewModel class







