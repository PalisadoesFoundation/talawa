




searchActive method - SelectOrganizationViewModel class - select\_organization\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/pre\_auth\_view\_models/select\_organization\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_select_organization_view_model/)
3. [SelectOrganizationViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel-class.html)
4. searchActive method

searchActive


dark\_mode

light\_mode




# searchActive method


void
searchActive()

if search is enabled.

**params**:
None

**returns**:
None


## Implementation

```
void searchActive() {
  if (searchFocus.hasFocus) {
    organizations = [];
    searching = true;
    setState(ViewState.idle);
  }
}
```

 


1. [talawa](../../index.html)
2. [select\_organization\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_select_organization_view_model/)
3. [SelectOrganizationViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel-class.html)
4. searchActive method

##### SelectOrganizationViewModel class





talawa
1.0.0+1






