
<div>

# searchActive method

</div>


void 



if search is enabled.

**params**: None

**returns**: None



## Implementation

``` language-dart
void  {
  if (searchFocus.hasFocus) {
    organizations = [];
    searching = true;
    setState(ViewState.idle);
  }
}
```







1.  [talawa](../../index.html)
2.  [select_organization_view_model](../../view_model_pre_auth_view_models_select_organization_view_model/)
3.  [SelectOrganizationViewModel](../../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel-class.html)
4.  searchActive method

##### SelectOrganizationViewModel class







