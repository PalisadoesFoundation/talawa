<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [utils/encryptor.dart](../../utils_encryptor/)
3.  [Encryptor](../../utils_encryptor/Encryptor-class.md)
4.  loadKeyPair method

<div class="self-name">

loadKeyPair

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

# <span class="kind-method">loadKeyPair</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)</span>
<span class="name">loadKeyPair</span>(

1.  <span id="loadKeyPair-param-hive"
    class="parameter"><span class="type-annotation">[HiveInterface](https://pub.dev/documentation/hive/2.2.3/hive/HiveInterface-class.md)</span>
    <span class="parameter-name">hive</span></span>

)

</div>

<div class="section desc markdown">

Loads secret keys from the Hive db.

**params**:

- `hive`: The
  [HiveInterface](https://pub.dev/documentation/hive/2.2.3/hive/HiveInterface-class.html)
  to load keys from.

**returns**:

- `Future<AsymmetricKeyPair<PublicKey, PrivateKey>>`: The public and
  private key pair

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
Future<AsymmetricKeyPair<PublicKey, PrivateKey>> loadKeyPair(
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
4.  loadKeyPair method

##### Encryptor class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
