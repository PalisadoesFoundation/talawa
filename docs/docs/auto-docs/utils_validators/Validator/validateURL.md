::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [utils/validators.dart](../../utils_validators/)
3.  [Validator](../../utils_validators/Validator-class.html)
4.  validateURL static method

::: self-name
validateURL
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="utils_validators/Validator-class-sidebar.html" below-sidebar=""}
<div>

# [validateURL]{.kind-method} static method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.returntype}
[validateURL]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [value]{.parameter-name}]{#validateURL-param-value .parameter}

)
:::

::: {.section .desc .markdown}
Method to validate an organization\'s URL.

**params**:

-   `value`: the URL of the organization

**returns**:

-   `String?`: error message if URL is invalid.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
static String? validateURL(
  String value,
) {
  if (value.isEmpty) {
    return 'Please verify URL first';
  }
  final bool validURL = Uri.parse(value).isAbsolute;
  if (!validURL) {
    return 'Enter a valid URL';
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
4.  validateURL static method

##### Validator class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
