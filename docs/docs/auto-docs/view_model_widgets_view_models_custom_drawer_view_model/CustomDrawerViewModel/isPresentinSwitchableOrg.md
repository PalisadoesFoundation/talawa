
<div>

# isPresentinSwitchableOrg method

</div>


[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
isPresentinSwitchableOrg(

1.  [[[OrgInfo](../../models_organization_org_info/OrgInfo-class.md)]
    switchToOrg]

)



This function checks `switchOrg` is present in the `switchAbleOrg`.

**params**:

-   `switchToOrg`: `OrgInfo` type of organization want to switch into.

**returns**:

-   `bool`: returns true if switchToOrg is in switchAbleOrg list.



## Implementation

``` language-dart
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







1.  [talawa](../../index.md)
2.  [custom_drawer_view_model](../../view_model_widgets_view_models_custom_drawer_view_model/)
3.  [CustomDrawerViewModel](../../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class.md)
4.  isPresentinSwitchableOrg method

##### CustomDrawerViewModel class







