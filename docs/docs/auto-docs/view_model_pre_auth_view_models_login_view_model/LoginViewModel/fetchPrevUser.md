::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_pre_auth_view_models_login_view_model/LoginViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [fetchPrevUser]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[fetchPrevUser]{.name}()
:::

::: {.section .desc .markdown}
Fetch the previous user credentials.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> fetchPrevUser() async {
  try {
    prevUserEmail = await secureStorage.read(key: "userEmail");
    prevUserPassword = await secureStorage.read(key: "userPassword");
  } catch (e) {
    print("Error decrypting previous values $e");
  }
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [login_view_model](../../view_model_pre_auth_view_models_login_view_model/)
3.  [LoginViewModel](../../view_model_pre_auth_view_models_login_view_model/LoginViewModel-class.html)
4.  fetchPrevUser method

##### LoginViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
