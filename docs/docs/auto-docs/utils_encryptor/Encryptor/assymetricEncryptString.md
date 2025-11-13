<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [utils/encryptor.dart](../../utils_encryptor/)
3.  [Encryptor](../../utils_encryptor/Encryptor-class.md)
4.  assymetricEncryptString method

<div class="self-name">

assymetricEncryptString

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

# <span class="kind-method">assymetricEncryptString</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>
<span class="name">assymetricEncryptString</span>(

1.  <span id="assymetricEncryptString-param-data"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span>
    <span class="parameter-name">data</span>, </span>
2.  <span id="assymetricEncryptString-param-recipientPublicKey"
    class="parameter"><span class="type-annotation">[RSAPublicKey](https://pub.dev/documentation/pointycastle/4.0.0/pointycastle/RSAPublicKey-class.html)</span>
    <span class="parameter-name">recipientPublicKey</span></span>

)

</div>

<div class="section desc markdown">

Encrypts the given string data with Recipient's Public Key.

**params**:

- `data`: The string to encrypt
- `recipientPublicKey`: Key to be used to encrypt. Recipient's public
  key in our case.

**returns**:

- `String`: Encrypted string

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
String assymetricEncryptString(String data, RSAPublicKey recipientPublicKey) 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [encryptor](../../utils_encryptor/)
3.  [Encryptor](../../utils_encryptor/Encryptor-class.md)
4.  assymetricEncryptString method

##### Encryptor class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
