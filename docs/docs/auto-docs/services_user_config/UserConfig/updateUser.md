::::::: {#dartdoc-main-content .main-content above-sidebar="services_user_config/UserConfig-class-sidebar.html" below-sidebar=""}
<div>

# [updateUser]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-parameter}\>]{.signature}]{.returntype}
[updateUser]{.name}(

1.  [[[User](../../models_user_user_info/User-class.html)]{.type-annotation}
    [updatedUserDetails]{.parameter-name}]{#updateUser-param-updatedUserDetails
    .parameter}

)
:::

::: {.section .desc .markdown}
Updates the user details.

**params**:

-   `updatedUserDetails`: `User` type variable containing all the
    details of an user need to be updated.

**returns**:

-   `Future<bool>`: returns future of bool type.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<bool> updateUser(User updatedUserDetails) async {
  try {
    _currentUser = updatedUserDetails;
    saveUserInHive();
    graphqlConfig.getToken();
    databaseFunctions.init();
    return true;
  } on Exception catch (e) {
    debugPrint(e.toString());
    return false;
  }
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
4.  updateUser method

##### UserConfig class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
