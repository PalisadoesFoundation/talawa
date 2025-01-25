::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [utils/encryptor.dart](../../utils_encryptor/)
3.  [Encryptor](../../utils_encryptor/Encryptor-class.html)
4.  shouldEncrypt property

::: self-name
shouldEncrypt
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="utils_encryptor/Encryptor-class-sidebar.html" below-sidebar=""}
<div>

# [shouldEncrypt]{.kind-property} property

</div>

::: {.section .multi-line-signature}
[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)
[shouldEncrypt]{.name}

::: features
[getter/setter pair]{.feature}
:::
:::

::: {.section .desc .markdown}
A global switch to flag the encryption.

Since adding encryption invalidates all of the previous data, disabling
it by default will help in keeping other contributors working without
any issue. TODO: Remove this and make encryption default.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
static bool shouldEncrypt = false;
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [encryptor](../../utils_encryptor/)
3.  [Encryptor](../../utils_encryptor/Encryptor-class.html)
4.  shouldEncrypt property

##### Encryptor class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
