::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [utils/encryptor.dart](../../utils_encryptor/)
3.  [Encryptor](../../utils_encryptor/Encryptor-class.html)
4.  generateRSAKeyPair method

::: self-name
generateRSAKeyPair
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="utils_encryptor/Encryptor-class-sidebar.html" below-sidebar=""}
<div>

# [generateRSAKeyPair]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[AsymmetricKeyPair](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/AsymmetricKeyPair-class.html)[\<[[PublicKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/PublicKey-class.html)]{.type-parameter},
[[PrivateKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/PrivateKey-class.html)]{.type-parameter}\>]{.signature}]{.returntype}
[generateRSAKeyPair]{.name}()
:::

::: {.section .desc .markdown}
Generates RSA Key Pairs (Public/Private).

Should be called only during app\'s first initialization, and any future
usage should be done by getting the keys from the local storage.

**params**: None

**returns**:

-   `AsymmetricKeyPair<PublicKey, PrivateKey>`: The generated public and
    private keys.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
AsymmetricKeyPair<PublicKey, PrivateKey> generateRSAKeyPair() {
  final secureRandom = FortunaRandom();
  final random = Random.secure();
  final List<int> seeds = [];
  for (int i = 0; i < 32; i++) {
    seeds.add(random.nextInt(255));
  }
  secureRandom.seed(KeyParameter(Uint8List.fromList(seeds)));
  final rsapars = RSAKeyGeneratorParameters(BigInt.from(65537), 2048, 64);
  final params = ParametersWithRandom(rsapars, secureRandom);
  final keyGenerator = RSAKeyGenerator();
  keyGenerator.init(params);
  return keyGenerator.generateKeyPair();
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
4.  generateRSAKeyPair method

##### Encryptor class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
