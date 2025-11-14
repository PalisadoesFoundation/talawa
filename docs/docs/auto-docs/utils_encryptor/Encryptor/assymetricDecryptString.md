<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [utils/encryptor.dart](../../utils_encryptor/)
3.  [Encryptor](../../utils_encryptor/Encryptor-class.md)
4.  assymetricDecryptString method

<div class="self-name">

assymetricDecryptString

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

# <span class="kind-method">assymetricDecryptString</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>
<span class="name">assymetricDecryptString</span>(

1.  <span id="assymetricDecryptString-param-data"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span>
    <span class="parameter-name">data</span>, </span>
2.  <span id="assymetricDecryptString-param-privateKey"
    class="parameter"><span class="type-annotation">[RSAPrivateKey](https://pub.dev/documentation/pointycastle/4.0.0/pointycastle/RSAPrivateKey-class.html)</span>
    <span class="parameter-name">privateKey</span></span>

)

</div>

<div class="section desc markdown">

Encrypts the given string data with user's Private Key.

**params**:

- `data`: The string to decrypt
- `privateKey`: Key to be used to decrypt. User's private key in our
  case.

**returns**:

- `String`: Decrypted string

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
String assymetricDecryptString(String data, RSAPrivateKey privateKey) 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [encryptor](../../utils_encryptor/)
3.  [Encryptor](../../utils_encryptor/Encryptor-class.md)
4.  assymetricDecryptString method

##### Encryptor class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
