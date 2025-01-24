




isPresentinSwitchableOrg method - CustomDrawerViewModel class - custom\_drawer\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/widgets\_view\_models/custom\_drawer\_view\_model.dart](../../view_model_widgets_view_models_custom_drawer_view_model/view_model_widgets_view_models_custom_drawer_view_model-library.html)
3. [CustomDrawerViewModel](../../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class.html)
4. isPresentinSwitchableOrg method

isPresentinSwitchableOrg


dark\_mode

light\_mode




# isPresentinSwitchableOrg method


bool
isPresentinSwitchableOrg(

1. [OrgInfo](../../models_organization_org_info/OrgInfo-class.html) switchToOrg

)

This function checks `switchOrg` is present in the `switchAbleOrg`.

**params**:

* `switchToOrg`: `OrgInfo` type of organization want to switch into.

**returns**:

* `bool`: returns true if switchToOrg is in switchAbleOrg list.

## Implementation

```
bool isPresentinSwitchableOrg(OrgInfo switchToOrg) {
  var isPresent = false;
  for (final OrgInfo orgs in switchAbleOrg) {
    if (orgs.id == switchToOrg.id) {
      isPresent = true;
    }
  }
  return isPresent;
}
```

 


1. [talawa](../../index.html)
2. [custom\_drawer\_view\_model](../../view_model_widgets_view_models_custom_drawer_view_model/view_model_widgets_view_models_custom_drawer_view_model-library.html)
3. [CustomDrawerViewModel](../../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class.html)
4. isPresentinSwitchableOrg method

##### CustomDrawerViewModel class





talawa
1.0.0+1






