




setSelectedOrganizationName method - CustomDrawerViewModel class - custom\_drawer\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/widgets\_view\_models/custom\_drawer\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_custom_drawer_view_model/)
3. [CustomDrawerViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class.html)
4. setSelectedOrganizationName method

setSelectedOrganizationName


dark\_mode

light\_mode




# setSelectedOrganizationName method


void
setSelectedOrganizationName(

1. dynamic updatedOrganization

)

This function switches the current organization to new organization.

**params**:

* `updatedOrganization`: `OrgInfo` type, new organization.

**returns**:
None


## Implementation

```
void setSelectedOrganizationName(OrgInfo updatedOrganization) {
  // if current and updated organization are not same.
  if (_selectedOrg != updatedOrganization) {
    _selectedOrg = updatedOrganization;
    // update in `UserConfig` variable.
    userConfig.currentOrgInfoController.add(_selectedOrg!);
    notifyListeners();
  }
}
```

 


1. [talawa](../../index.html)
2. [custom\_drawer\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_custom_drawer_view_model/)
3. [CustomDrawerViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class.html)
4. setSelectedOrganizationName method

##### CustomDrawerViewModel class





talawa
1.0.0+1






