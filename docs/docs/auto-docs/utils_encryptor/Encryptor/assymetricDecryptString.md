::::::: {#dartdoc-main-content .main-content above-sidebar="utils_encryptor/Encryptor-class-sidebar.html" below-sidebar=""}
<div>

# [assymetricDecryptString]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[assymetricDecryptString]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [data]{.parameter-name}, ]{#assymetricDecryptString-param-data
    .parameter}
2.  [[[RSAPrivateKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/RSAPrivateKey-class.html)]{.type-annotation}
    [privateKey]{.parameter-name}]{#assymetricDecryptString-param-privateKey
    .parameter}

)
:::

::: {.section .desc .markdown}
Encrypts the given string data with user\'s Private Key.

**params**:

-   `data`: The string to decrypt
-   `privateKey`: Key to be used to decrypt. User\'s private key in our
    case.

**returns**:

-   `String`: Decrypted string
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
String assymetricDecryptString(String data, RSAPrivateKey privateKey) {
  final cipher = OAEPEncoding(RSAEngine())
    ..init(false, PrivateKeyParameter<RSAPrivateKey>(privateKey));

  final decryptedBytes = cipher.process(base64Decode(data));
  return String.fromCharCodes(decryptedBytes);
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [encryptor](../../utils_encryptor/)
3.  [Encryptor](../../utils_encryptor/Encryptor-class.html)
4.  assymetricDecryptString method

##### Encryptor class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
