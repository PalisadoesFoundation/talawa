<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [utils/encryptor.dart](../../utils_encryptor/utils_encryptor-library.md)
3.  [Encryptor](../../utils_encryptor/Encryptor-class.md)
4.  receiveMessage method

<div class="self-name">

receiveMessage

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="utils_encryptor/Encryptor-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">receiveMessage</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span>
<span class="name">receiveMessage</span>(

1.  <span id="receiveMessage-param-message"
    class="parameter"><span class="type-annotation">[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>,
    <span class="type-parameter">dynamic</span>\></span></span>
    <span class="parameter-name">message</span>, </span>
2.  <span id="receiveMessage-param-hive"
    class="parameter"><span class="type-annotation">[HiveInterface](https://pub.dev/documentation/hive/2.2.3/hive/HiveInterface-class.html)</span>
    <span class="parameter-name">hive</span></span>

)

</div>

<div class="section desc markdown">

Helper function to decrypt the message.

Internally uses the
[loadKeyPair](../../utils_encryptor/Encryptor/loadKeyPair.md) function
to get private key and
[assymetricDecryptString](../../utils_encryptor/Encryptor/assymetricDecryptString.md)
to decrypt the given message.

**params**:

- `message`: Message object containing a field named `encryptedMessage`
  which is supposed to contained user's message in encrypted format.
- `hive`: The
  [HiveInterface](https://pub.dev/documentation/hive/2.2.3/hive/HiveInterface-class.html)
  to store things in.

**returns**: None

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
Future<void> receiveMessage(
  Map<String, dynamic> message,
  HiveInterface hive,
) async 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [encryptor](../../utils_encryptor/utils_encryptor-library.md)
3.  [Encryptor](../../utils_encryptor/Encryptor-class.md)
4.  receiveMessage method

##### Encryptor class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
