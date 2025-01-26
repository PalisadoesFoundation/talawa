::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [widgets/directly_login.dart](../../widgets_directly_login/)
3.  [DirectlyLogin](../../widgets_directly_login/DirectlyLogin-class.html)
4.  loginUsingPrevCredentials method

::: self-name
loginUsingPrevCredentials
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="widgets_directly_login/DirectlyLogin-class-sidebar.html" below-sidebar=""}
<div>

# [loginUsingPrevCredentials]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[loginUsingPrevCredentials]{.name}()
:::

::: {.section .desc .markdown}
This method is used to login useing saved detials.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> loginUsingPrevCredentials() async {
  model.email.text = model.prevUserEmail ?? '';
  model.password.text = model.prevUserPassword ?? '';
  await model.login();
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [directly_login](../../widgets_directly_login/)
3.  [DirectlyLogin](../../widgets_directly_login/DirectlyLogin-class.html)
4.  loginUsingPrevCredentials method

##### DirectlyLogin class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
