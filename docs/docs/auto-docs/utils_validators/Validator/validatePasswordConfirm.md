::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [utils/validators.dart](../../utils_validators/)
3.  [Validator](../../utils_validators/Validator-class.html)
4.  validatePasswordConfirm static method

::: self-name
validatePasswordConfirm
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="utils_validators/Validator-class-sidebar.html" below-sidebar=""}
<div>

# [validatePasswordConfirm]{.kind-method} static method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.returntype}
[validatePasswordConfirm]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [value]{.parameter-name}, ]{#validatePasswordConfirm-param-value
    .parameter}
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [comparator]{.parameter-name}]{#validatePasswordConfirm-param-comparator
    .parameter}

)
:::

::: {.section .desc .markdown}
Method to valid password re-entered for confirmation.

**params**:

-   `value`: the entered password
-   `comparator`: the original password

**returns**:

-   `String?`: error message if password is invalid.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
static String? validatePasswordConfirm(
  String value,
  String comparator,
) {
  if (value != comparator) {
    return 'Password does not match original';
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
4.  validatePasswordConfirm static method

##### Validator class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
