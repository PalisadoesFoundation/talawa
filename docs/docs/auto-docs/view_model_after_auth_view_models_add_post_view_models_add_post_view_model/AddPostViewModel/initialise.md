::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [initialise]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [initialise]{.name}()
:::

::: {.section .desc .markdown}
This function is usedto do initialisation of stuff in the view model.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
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
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [add_post_view_model](../../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/)
3.  [AddPostViewModel](../../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel-class.html)
4.  initialise method

##### AddPostViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
