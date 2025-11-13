<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [utils/encryptor.dart](../utils_encryptor/)
3.  Encryptor class

<div class="self-name">

Encryptor

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="utils_encryptor/utils_encryptor-library-sidebar.html"
below-sidebar="utils_encryptor/Encryptor-class-sidebar.html">

<div>

# <span class="kind-class">Encryptor</span> class

</div>

<div class="section desc markdown">

Handles all of the encryption tasks in the codebase.

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[Encryptor.new](../utils_encryptor/Encryptor/Encryptor.md)</span><span class="signature"></span>  

</div>

<div id="instance-properties"
class="section summary offset-anchor inherited">

## Properties

<span class="name">[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)</span> <span class="signature">→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)</span>  
A representation of the runtime type of the object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

</div>

<div id="instance-methods" class="section summary offset-anchor">

## Methods

<span class="name">[assymetricDecryptString](../utils_encryptor/Encryptor/assymetricDecryptString.md)</span><span class="signature">(<span id="assymetricDecryptString-param-data" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">data</span>, </span><span id="assymetricDecryptString-param-privateKey" class="parameter"><span class="type-annotation">[RSAPrivateKey](https://pub.dev/documentation/pointycastle/4.0.0/pointycastle/RSAPrivateKey-class.html)</span> <span class="parameter-name">privateKey</span></span>) <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
Encrypts the given string data with user's Private Key.

<span class="name">[assymetricEncryptString](../utils_encryptor/Encryptor/assymetricEncryptString.md)</span><span class="signature">(<span id="assymetricEncryptString-param-data" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">data</span>, </span><span id="assymetricEncryptString-param-recipientPublicKey" class="parameter"><span class="type-annotation">[RSAPublicKey](https://pub.dev/documentation/pointycastle/4.0.0/pointycastle/RSAPublicKey-class.html)</span> <span class="parameter-name">recipientPublicKey</span></span>) <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
Encrypts the given string data with Recipient's Public Key.

<span class="name">[generateRSAKeyPair](../utils_encryptor/Encryptor/generateRSAKeyPair.md)</span><span class="signature"> <span class="returntype parameter">→ [AsymmetricKeyPair](https://pub.dev/documentation/pointycastle/4.0.0/pointycastle/AsymmetricKeyPair-class.html)<span class="signature">\<<span class="type-parameter">[PublicKey](https://pub.dev/documentation/pointycastle/4.0.0/pointycastle/PublicKey-class.html)</span>, <span class="type-parameter">[PrivateKey](https://pub.dev/documentation/pointycastle/4.0.0/pointycastle/PrivateKey-class.html)</span>\></span></span> </span>  
Generates RSA Key Pairs (Public/Private).

<span class="name">[loadKeyPair](../utils_encryptor/Encryptor/loadKeyPair.md)</span><span class="signature">(<span id="loadKeyPair-param-hive" class="parameter"><span class="type-annotation">[HiveInterface](https://pub.dev/documentation/hive/2.2.3/hive/HiveInterface-class.md)</span> <span class="parameter-name">hive</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">[AsymmetricKeyPair](https://pub.dev/documentation/pointycastle/4.0.0/pointycastle/AsymmetricKeyPair-class.html)<span class="signature">\<<span class="type-parameter">[PublicKey](https://pub.dev/documentation/pointycastle/4.0.0/pointycastle/PublicKey-class.html)</span>, <span class="type-parameter">[PrivateKey](https://pub.dev/documentation/pointycastle/4.0.0/pointycastle/PrivateKey-class.html)</span>\></span></span>\></span></span> </span>  
Loads secret keys from the Hive db.

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[receiveMessage](../utils_encryptor/Encryptor/receiveMessage.md)</span><span class="signature">(<span id="receiveMessage-param-message" class="parameter"><span class="type-annotation">[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>, <span class="type-parameter">dynamic</span>\></span></span> <span class="parameter-name">message</span>, </span><span id="receiveMessage-param-hive" class="parameter"><span class="type-annotation">[HiveInterface](https://pub.dev/documentation/hive/2.2.3/hive/HiveInterface-class.html)</span> <span class="parameter-name">hive</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Helper function to decrypt the message.

<span class="name">[saveKeyPair](../utils_encryptor/Encryptor/saveKeyPair.md)</span><span class="signature">(<span id="saveKeyPair-param-keyPair" class="parameter"><span class="type-annotation">[AsymmetricKeyPair](https://pub.dev/documentation/pointycastle/4.0.0/pointycastle/AsymmetricKeyPair-class.md)<span class="signature">\<<span class="type-parameter">[PublicKey](https://pub.dev/documentation/pointycastle/4.0.0/pointycastle/PublicKey-class.html)</span>, <span class="type-parameter">[PrivateKey](https://pub.dev/documentation/pointycastle/4.0.0/pointycastle/PrivateKey-class.html)</span>\></span></span> <span class="parameter-name">keyPair</span>, </span><span id="saveKeyPair-param-hive" class="parameter"><span class="type-annotation">[HiveInterface](https://pub.dev/documentation/hive/2.2.3/hive/HiveInterface-class.html)</span> <span class="parameter-name">hive</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Saves the generated key pair to local storage.

<span class="name">[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
A string representation of this object.

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

<div id="operators" class="section summary offset-anchor inherited">

## Operators

<span class="name">[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)</span><span class="signature">(<span id="==-param-other" class="parameter"><span class="type-annotation">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)</span> <span class="parameter-name">other</span></span>) <span class="returntype parameter">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span> </span>  
The equality operator.

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

<div id="static-properties" class="section summary offset-anchor">

## Static Properties

<span class="name">[shouldEncrypt](../utils_encryptor/Encryptor/shouldEncrypt.md)</span> <span class="signature">↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
A global switch to flag the encryption.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

</div>

<div id="static-methods" class="section summary offset-anchor">

## Static Methods

<span class="name">[encryptString](../utils_encryptor/Encryptor/encryptString.md)</span><span class="signature">(<span id="encryptString-param-data" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">data</span></span>) <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
Encrypts a given string with SHA256 Encryption.

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../index.md)
2.  [encryptor](../utils_encryptor/)
3.  Encryptor class

##### encryptor library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
