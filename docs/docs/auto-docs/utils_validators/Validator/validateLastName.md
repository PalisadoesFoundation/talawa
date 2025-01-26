::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [utils/validators.dart](../../utils_validators/)
3.  [Validator](../../utils_validators/Validator-class.html)
4.  validateLastName static method

::: self-name
validateLastName
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="utils_validators/Validator-class-sidebar.html" below-sidebar=""}
<div>

# [validateLastName]{.kind-method} static method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.returntype}
[validateLastName]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [value]{.parameter-name}]{#validateLastName-param-value .parameter}

)
:::

::: {.section .desc .markdown}
Method to validate a user\'s last name.

**params**:

-   `value`: the value of the last name

**returns**:

-   `String?`: error message if last name is invalid.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
static String? validateLastName(String value) {
  if (value.isEmpty) {
    return 'Lastname must not be left blank.';
  }
  // ignore: unnecessary_raw_strings
  const String pattern = r"(?=.*?[A-Za-z]).+";
  final RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return "Invalid Lastname";
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
4.  validateLastName static method

##### Validator class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
