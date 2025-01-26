::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [utils/validators.dart](../../utils_validators/)
3.  [Validator](../../utils_validators/Validator-class.html)
4.  validateUrlExistence method

::: self-name
validateUrlExistence
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="utils_validators/Validator-class-sidebar.html" below-sidebar=""}
<div>

# [validateUrlExistence]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?]{.type-parameter}\>]{.signature}]{.returntype}
[validateUrlExistence]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [url]{.parameter-name}]{#validateUrlExistence-param-url .parameter}

)
:::

::: {.section .desc .markdown}
Method to validate already exisiting URL.

**params**:

-   `url`: the entered URL

**returns**:

-   `Future<bool?>`: true if URL exists, false otherwise.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<bool?> validateUrlExistence(String url) async {
  try {
    await http.get(Uri.parse(url));
    return true;
  } on Exception catch (e) {
    debugPrint(e.toString());
    return false;
  }
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
4.  validateUrlExistence method

##### Validator class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
