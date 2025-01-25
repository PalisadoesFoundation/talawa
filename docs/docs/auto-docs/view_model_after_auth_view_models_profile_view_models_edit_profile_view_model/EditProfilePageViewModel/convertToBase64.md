::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/after_auth_view_models/profile_view_models/edit_profile_view_model.dart](../../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/)
3.  [EditProfilePageViewModel](../../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel-class.html)
4.  convertToBase64 method

::: self-name
convertToBase64
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [convertToBase64]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}\>]{.signature}]{.returntype}
[convertToBase64]{.name}(

1.  [[[File](https://api.flutter.dev/flutter/dart-io/File-class.html)]{.type-annotation}
    [file]{.parameter-name}]{#convertToBase64-param-file .parameter}

)
:::

::: {.section .desc .markdown}
This function is used to convert the image into Base64 format.

**params**:

-   `file`: Takes the image in format of file.

**returns**:

-   `Future<String>`: image in string format
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<String> convertToBase64(File file) async {
  try {
    base64Image = await imageService.convertToBase64(file);
    return base64Image!;
  } catch (error) {
    print(error);
    return '';
  }
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [edit_profile_view_model](../../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/)
3.  [EditProfilePageViewModel](../../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel-class.html)
4.  convertToBase64 method

##### EditProfilePageViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
