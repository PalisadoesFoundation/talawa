::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [utils/encryptor.dart](../../utils_encryptor/)
3.  [Encryptor](../../utils_encryptor/Encryptor-class.html)
4.  saveKeyPair method

::: self-name
saveKeyPair
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="utils_encryptor/Encryptor-class-sidebar.html" below-sidebar=""}
<div>

# [saveKeyPair]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[saveKeyPair]{.name}(

1.  [[[AsymmetricKeyPair](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/AsymmetricKeyPair-class.html)[\<[[PublicKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/PublicKey-class.html)]{.type-parameter},
    [[PrivateKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/PrivateKey-class.html)]{.type-parameter}\>]{.signature}]{.type-annotation}
    [keyPair]{.parameter-name}, ]{#saveKeyPair-param-keyPair .parameter}
2.  [[[HiveInterface](https://pub.dev/documentation/hive/2.2.3/hive/HiveInterface-class.html)]{.type-annotation}
    [hive]{.parameter-name}]{#saveKeyPair-param-hive .parameter}

)
:::

::: {.section .desc .markdown}
Saves the generated key pair to local storage.

Any future usage of the keys must be initiated from here.

**params**:

-   `keyPair`:
    [AsymmetricKeyPair](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/AsymmetricKeyPair-class.html)
    to save.
-   `hive`: The
    [HiveInterface](https://pub.dev/documentation/hive/2.2.3/hive/HiveInterface-class.html)
    to store keys in.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> saveKeyPair(
  AsymmetricKeyPair<PublicKey, PrivateKey> keyPair,
  HiveInterface hive,
) async {
  // TODO: Implement secure storage here
  final Box<AsymetricKeys> keysBox =
      await hive.openBox<AsymetricKeys>('user_keys');
  keysBox.put('key_pair', AsymetricKeys(keyPair: keyPair));
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
4.  saveKeyPair method

##### Encryptor class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
