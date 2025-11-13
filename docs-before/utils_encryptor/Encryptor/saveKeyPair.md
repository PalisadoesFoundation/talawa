<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [utils/encryptor.dart](../../utils_encryptor/)
3.  [Encryptor](../../utils_encryptor/Encryptor-class.md)
4.  saveKeyPair method

<div class="self-name">

saveKeyPair

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="utils_encryptor/Encryptor-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">saveKeyPair</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span>
<span class="name">saveKeyPair</span>(

1.  <span id="saveKeyPair-param-keyPair"
    class="parameter"><span class="type-annotation">[AsymmetricKeyPair](https://pub.dev/documentation/pointycastle/4.0.0/pointycastle/AsymmetricKeyPair-class.md)<span class="signature">\<<span class="type-parameter">[PublicKey](https://pub.dev/documentation/pointycastle/4.0.0/pointycastle/PublicKey-class.html)</span>,
    <span class="type-parameter">[PrivateKey](https://pub.dev/documentation/pointycastle/4.0.0/pointycastle/PrivateKey-class.html)</span>\></span></span>
    <span class="parameter-name">keyPair</span>, </span>
2.  <span id="saveKeyPair-param-hive"
    class="parameter"><span class="type-annotation">[HiveInterface](https://pub.dev/documentation/hive/2.2.3/hive/HiveInterface-class.html)</span>
    <span class="parameter-name">hive</span></span>

)

</div>

<div class="section desc markdown">

Saves the generated key pair to local storage.

Any future usage of the keys must be initiated from here.

**params**:

- `keyPair`:
  [AsymmetricKeyPair](https://pub.dev/documentation/pointycastle/4.0.0/pointycastle/AsymmetricKeyPair-class.html)
  to save.
- `hive`: The
  [HiveInterface](https://pub.dev/documentation/hive/2.2.3/hive/HiveInterface-class.html)
  to store keys in.

**returns**: None

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
Future<void> saveKeyPair(
  AsymmetricKeyPair<PublicKey, PrivateKey> keyPair,
  HiveInterface hive,
) async 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [encryptor](../../utils_encryptor/)
3.  [Encryptor](../../utils_encryptor/Encryptor-class.md)
4.  saveKeyPair method

##### Encryptor class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
