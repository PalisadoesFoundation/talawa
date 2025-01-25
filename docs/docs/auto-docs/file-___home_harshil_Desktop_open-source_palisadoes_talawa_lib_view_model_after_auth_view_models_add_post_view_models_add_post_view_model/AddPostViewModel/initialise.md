




initialise method - AddPostViewModel class - add\_post\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/add\_post\_view\_models/add\_post\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_add_post_view_models_add_post_view_model/)
3. [AddPostViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel-class.html)
4. initialise method

initialise


dark\_mode

light\_mode




# initialise method


void
initialise()

This function is usedto do initialisation of stuff in the view model.

**params**:
None

**returns**:
None


## Implementation

```
void initialise() {
  _navigationService = locator<NavigationService>();
  _imageFile = null;
  _imageInBase64 = null;
  _multiMediaPickerService = locator<MultiMediaPickerService>();
  _imageService = locator<ImageService>();
  if (!demoMode) {
    _dbFunctions = locator<DataBaseMutationFunctions>();
    _selectedOrg = locator<UserConfig>().currentOrg;
  }
}
```

 


1. [talawa](../../index.html)
2. [add\_post\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_add_post_view_models_add_post_view_model/)
3. [AddPostViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel-class.html)
4. initialise method

##### AddPostViewModel class





talawa
1.0.0+1






