
<div>

# initialize method

</div>


void 



First function to initialize the viewmodel.

**params**: None

**returns**: None



## Implementation

``` language-dart
void  {
  setState(ViewState.busy);
  currentOrg = _userConfig.currentOrg;
  currentUser = _userConfig.currentUser;
  setState(ViewState.idle);
}
```







1.  [talawa](../../index.html)
2.  [profile_page_view_model](../../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/)
3.  [ProfilePageViewModel](../../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel-class.html)
4.  initialize method

##### ProfilePageViewModel class







