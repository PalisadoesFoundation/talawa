::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [utils/validators.dart](../../utils_validators/)
3.  [Validator](../../utils_validators/Validator-class.html)
4.  validatePassword static method

::: self-name
validatePassword
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="utils_validators/Validator-class-sidebar.html" below-sidebar=""}
<div>

# [validatePassword]{.kind-method} static method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.returntype}
[validatePassword]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [password]{.parameter-name}]{#validatePassword-param-password
    .parameter}

)
:::

::: {.section .desc .markdown}
Method to validate password.

**params**:

-   `password`: the entered password

**returns**:

-   `String?`: error message if password is invalid.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
static String? validatePassword(
  String password,
) {
  // If password is empty return.
  if (password.isEmpty) {
    return "Password must not be left blank";
  }
  const String pattern =
      r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*%^~.]).{8,}$';
  final RegExp regExp = RegExp(pattern);

  //Regex for no spaces allowed
  const String noSpaces = r'^\S+$';
  final RegExp noSpaceRegex = RegExp(noSpaces);

  if (!noSpaceRegex.hasMatch(password)) {
    return "Password must not contain spaces";
  }
  if (!regExp.hasMatch(password)) {
    return "Your password must be at least 8 characters long, contain at least one numeric, one uppercase and one lowercase letters and one special character (@,#,\$,etc.)";
  }

  return null;
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [validators](../../utils_validators/)
3.  [Validator](../../utils_validators/Validator-class.html)
4.  validatePassword static method

##### Validator class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
