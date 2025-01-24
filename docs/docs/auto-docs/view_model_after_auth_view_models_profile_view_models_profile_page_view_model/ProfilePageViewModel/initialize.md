




initialize method - ProfilePageViewModel class - profile\_page\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/profile\_view\_models/profile\_page\_view\_model.dart](../../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/view_model_after_auth_view_models_profile_view_models_profile_page_view_model-library.html)
3. [ProfilePageViewModel](../../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel-class.html)
4. initialize method

initialize


dark\_mode

light\_mode




# initialize method


void
initialize()

First function to initialize the viewmodel.

**params**:
None

**returns**:
None


## Implementation

```
void initialize() {
  setState(ViewState.busy);
  currentOrg = _userConfig.currentOrg;
  currentUser = _userConfig.currentUser;
  setState(ViewState.idle);
}
```

 


1. [talawa](../../index.html)
2. [profile\_page\_view\_model](../../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/view_model_after_auth_view_models_profile_view_models_profile_page_view_model-library.html)
3. [ProfilePageViewModel](../../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel-class.html)
4. initialize method

##### ProfilePageViewModel class





talawa
1.0.0+1






