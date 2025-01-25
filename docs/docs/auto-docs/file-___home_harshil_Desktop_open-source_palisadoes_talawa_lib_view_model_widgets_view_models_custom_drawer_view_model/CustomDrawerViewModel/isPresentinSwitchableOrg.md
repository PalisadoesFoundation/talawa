




isPresentinSwitchableOrg method - CustomDrawerViewModel class - custom\_drawer\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/widgets\_view\_models/custom\_drawer\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_custom_drawer_view_model/)
3. [CustomDrawerViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class.html)
4. isPresentinSwitchableOrg method

isPresentinSwitchableOrg


dark\_mode

light\_mode




# isPresentinSwitchableOrg method


[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)
isPresentinSwitchableOrg(

1. dynamic switchToOrg

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
2. [custom\_drawer\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_custom_drawer_view_model/)
3. [CustomDrawerViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class.html)
4. isPresentinSwitchableOrg method

##### CustomDrawerViewModel class





talawa
1.0.0+1






