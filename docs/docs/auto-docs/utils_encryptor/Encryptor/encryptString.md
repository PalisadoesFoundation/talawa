::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [utils/encryptor.dart](../../utils_encryptor/)
3.  [Encryptor](../../utils_encryptor/Encryptor-class.html)
4.  encryptString static method

::: self-name
encryptString
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="utils_encryptor/Encryptor-class-sidebar.html" below-sidebar=""}
<div>

# [encryptString]{.kind-method} static method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[encryptString]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [data]{.parameter-name}]{#encryptString-param-data .parameter}

)
:::

::: {.section .desc .markdown}
Encrypts a given string with SHA256 Encryption.

**params**:

-   `data`: The string data to encrypt

**returns**:

-   `String`: SHA256 encrypted data
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
static String encryptString(String data) {
  if (!shouldEncrypt) return data;
  return sha256.convert(utf8.encode(data)).toString();
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [encryptor](../../utils_encryptor/)
3.  [Encryptor](../../utils_encryptor/Encryptor-class.html)
4.  encryptString static method

##### Encryptor class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
