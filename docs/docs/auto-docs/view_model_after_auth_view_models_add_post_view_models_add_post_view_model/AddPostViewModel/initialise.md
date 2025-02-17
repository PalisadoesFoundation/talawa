
<div>

# initialise method

</div>


void 



This function is usedto do initialisation of stuff in the view model.

**params**: None

**returns**: None



## Implementation

``` language-dart
void  {
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







1.  [talawa](../../index.html)
2.  [add_post_view_model](../../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/)
3.  [AddPostViewModel](../../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel-class.html)
4.  initialise method

##### AddPostViewModel class







