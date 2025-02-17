::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [initialize]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [initialize]{.name}()
:::

::: {.section .desc .markdown}
initialization function.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void initialize() {
  imageFile = null;
  _multiMediaPickerService = locator<MultiMediaPickerService>();
  firstNameTextController = TextEditingController(text: user.firstName);
  lastNameTextController = TextEditingController(text: user.lastName);
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [edit_profile_view_model](../../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/)
3.  [EditProfilePageViewModel](../../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel-class.html)
4.  initialize method

##### EditProfilePageViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
