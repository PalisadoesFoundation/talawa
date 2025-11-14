<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [encryptor](../../utils_encryptor/utils_encryptor-library.md)
3.  [Encryptor](../../utils_encryptor/Encryptor-class.md)
4.  generateRSAKeyPair method

<div class="self-name">

generateRSAKeyPair

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="utils_encryptor/Encryptor-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">generateRSAKeyPair</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[AsymmetricKeyPair](https://pub.dev/documentation/pointycastle/4.0.0/api/AsymmetricKeyPair-class.html)<span class="signature">\<<span class="type-parameter">[PublicKey](https://pub.dev/documentation/pointycastle/4.0.0/api/PublicKey-class.html)</span>,
<span class="type-parameter">[PrivateKey](https://pub.dev/documentation/pointycastle/4.0.0/api/PrivateKey-class.html)</span>\></span></span>
<span class="name">generateRSAKeyPair</span>

</div>

<div class="section desc markdown">

Generates RSA Key Pairs (Public/Private).

Should be called only during app's first initialization, and any future
usage should be done by getting the keys from the local storage.

**params**: None

**returns**:

- `AsymmetricKeyPair<PublicKey, PrivateKey>`: The generated public and
  private keys.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
AsymmetricKeyPair<PublicKey, PrivateKey>  
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [encryptor](../../utils_encryptor/utils_encryptor-library.md)
3.  [Encryptor](../../utils_encryptor/Encryptor-class.md)
4.  generateRSAKeyPair method

##### Encryptor class

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
