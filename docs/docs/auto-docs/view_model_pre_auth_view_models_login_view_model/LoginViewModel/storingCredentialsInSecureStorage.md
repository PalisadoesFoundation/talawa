::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/pre_auth_view_models/login_view_model.dart](../../view_model_pre_auth_view_models_login_view_model/)
3.  [LoginViewModel](../../view_model_pre_auth_view_models_login_view_model/LoginViewModel-class.html)
4.  storingCredentialsInSecureStorage method

::: self-name
storingCredentialsInSecureStorage
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_pre_auth_view_models_login_view_model/LoginViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [storingCredentialsInSecureStorage]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[storingCredentialsInSecureStorage]{.name}()
:::

::: {.section .desc .markdown}
Storing credentials in secure storage.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> storingCredentialsInSecureStorage() async {
  try {
    await secureStorage.write(
      key: "userEmail",
      value: this.email.text,
    );
    await secureStorage.write(
      key: "userPassword",
      value: this.password.text,
    );
  } catch (e) {
    // Handle secure storage write failure
    print("Failed to save credentials: $e");
  }
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [login_view_model](../../view_model_pre_auth_view_models_login_view_model/)
3.  [LoginViewModel](../../view_model_pre_auth_view_models_login_view_model/LoginViewModel-class.html)
4.  storingCredentialsInSecureStorage method

##### LoginViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
