::::::: {#dartdoc-main-content .main-content above-sidebar="services_user_config/UserConfig-class-sidebar.html" below-sidebar=""}
<div>

# [updateAccessToken]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[updateAccessToken]{.name}({

1.  [required
    [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [accessToken]{.parameter-name},
    ]{#updateAccessToken-param-accessToken .parameter}
2.  [required
    [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [refreshToken]{.parameter-name},
    ]{#updateAccessToken-param-refreshToken .parameter}

})
:::

::: {.section .desc .markdown}
Updates the access token of the user.

**params**:

-   `accessToken`: current user\'s accesstoken.
-   `refreshToken`: current user\'s refreshtoken.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> updateAccessToken({
  required String accessToken,
  required String refreshToken,
}) async {
  _currentUser!.refreshToken = refreshToken;
  _currentUser!.authToken = accessToken;
  saveUserInHive();
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [user_config](../../services_user_config/)
3.  [UserConfig](../../services_user_config/UserConfig-class.html)
4.  updateAccessToken method

##### UserConfig class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
