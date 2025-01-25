::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [utils/encryptor.dart](../../utils_encryptor/)
3.  [Encryptor](../../utils_encryptor/Encryptor-class.html)
4.  assymetricEncryptString method

::: self-name
assymetricEncryptString
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="utils_encryptor/Encryptor-class-sidebar.html" below-sidebar=""}
<div>

# [assymetricEncryptString]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[assymetricEncryptString]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [data]{.parameter-name}, ]{#assymetricEncryptString-param-data
    .parameter}
2.  [[[RSAPublicKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/RSAPublicKey-class.html)]{.type-annotation}
    [recipientPublicKey]{.parameter-name}]{#assymetricEncryptString-param-recipientPublicKey
    .parameter}

)
:::

::: {.section .desc .markdown}
Encrypts the given string data with Recipient\'s Public Key.

**params**:

-   `data`: The string to encrypt
-   `recipientPublicKey`: Key to be used to encrypt. Recipient\'s public
    key in our case.

**returns**:

-   `String`: Encrypted string
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
String assymetricEncryptString(String data, RSAPublicKey recipientPublicKey) {
  final cipher = OAEPEncoding(RSAEngine())
    ..init(true, PublicKeyParameter<RSAPublicKey>(recipientPublicKey));

  final encryptedBytes = cipher.process(Uint8List.fromList(data.codeUnits));
  return base64Encode(encryptedBytes);
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
4.  assymetricEncryptString method

##### Encryptor class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
