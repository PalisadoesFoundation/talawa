::::::: {#dartdoc-main-content .main-content above-sidebar="utils_encryptor/Encryptor-class-sidebar.html" below-sidebar=""}
<div>

# [loadKeyPair]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[AsymmetricKeyPair](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/AsymmetricKeyPair-class.html)[\<[[PublicKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/PublicKey-class.html)]{.type-parameter},
[[PrivateKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/PrivateKey-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.returntype}
[loadKeyPair]{.name}(

1.  [[[HiveInterface](https://pub.dev/documentation/hive/2.2.3/hive/HiveInterface-class.html)]{.type-annotation}
    [hive]{.parameter-name}]{#loadKeyPair-param-hive .parameter}

)
:::

::: {.section .desc .markdown}
Loads secret keys from the Hive db.

**params**:

-   `hive`: The
    [HiveInterface](https://pub.dev/documentation/hive/2.2.3/hive/HiveInterface-class.html)
    to load keys from.

**returns**:

-   `Future<AsymmetricKeyPair<PublicKey, PrivateKey>>`: The public and
    private key pair
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<AsymmetricKeyPair<PublicKey, PrivateKey>> loadKeyPair(
  HiveInterface hive,
) async {
  final keysBox = await hive.openBox<AsymetricKeys>('user_keys');
  return keysBox.get('key_pair')!.keyPair;
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
4.  loadKeyPair method

##### Encryptor class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
