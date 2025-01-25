::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../index.html)
2.  [utils/encryptor.dart](../utils_encryptor/)
3.  Encryptor class

::: self-name
Encryptor
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="utils_encryptor/utils_encryptor-library-sidebar.html" below-sidebar="utils_encryptor/Encryptor-class-sidebar.html"}
<div>

# [Encryptor]{.kind-class} class

</div>

::: {.section .desc .markdown}
Handles all of the encryption tasks in the codebase.
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[Encryptor](../utils_encryptor/Encryptor/Encryptor.html)]{.name}[()]{.signature}

:   
:::

::: {#instance-properties .section .summary .offset-anchor .inherited}
## Properties

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)]{.name} [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.signature}
:   The hash code for this object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)]{.name} [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]{.signature}
:   A representation of the runtime type of the object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::
:::

::: {#instance-methods .section .summary .offset-anchor}
## Methods

[[assymetricDecryptString](../utils_encryptor/Encryptor/assymetricDecryptString.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [data]{.parameter-name}, ]{#assymetricDecryptString-param-data .parameter}[[[RSAPrivateKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/RSAPrivateKey-class.html)]{.type-annotation} [privateKey]{.parameter-name}]{#assymetricDecryptString-param-privateKey .parameter}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   Encrypts the given string data with user\'s Private Key.

[[assymetricEncryptString](../utils_encryptor/Encryptor/assymetricEncryptString.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [data]{.parameter-name}, ]{#assymetricEncryptString-param-data .parameter}[[[RSAPublicKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/RSAPublicKey-class.html)]{.type-annotation} [recipientPublicKey]{.parameter-name}]{#assymetricEncryptString-param-recipientPublicKey .parameter}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   Encrypts the given string data with Recipient\'s Public Key.

[[generateRSAKeyPair](../utils_encryptor/Encryptor/generateRSAKeyPair.html)]{.name}[() [→ [AsymmetricKeyPair](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/AsymmetricKeyPair-class.html)[\<[[PublicKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/PublicKey-class.html)]{.type-parameter}, [[PrivateKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/PrivateKey-class.html)]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Generates RSA Key Pairs (Public/Private).

[[loadKeyPair](../utils_encryptor/Encryptor/loadKeyPair.html)]{.name}[([[[HiveInterface](https://pub.dev/documentation/hive/2.2.3/hive/HiveInterface-class.html)]{.type-annotation} [hive]{.parameter-name}]{#loadKeyPair-param-hive .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[AsymmetricKeyPair](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/AsymmetricKeyPair-class.html)[\<[[PublicKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/PublicKey-class.html)]{.type-parameter}, [[PrivateKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/PrivateKey-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Loads secret keys from the Hive db.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)]{.name}[([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)]{.type-annotation} [invocation]{.parameter-name}]{#noSuchMethod-param-invocation .parameter}) [→ dynamic]{.returntype .parameter} ]{.signature}
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    [inherited]{.feature}
    :::

[[receiveMessage](../utils_encryptor/Encryptor/receiveMessage.html)]{.name}[([[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}, [dynamic]{.type-parameter}\>]{.signature}]{.type-annotation} [message]{.parameter-name}, ]{#receiveMessage-param-message .parameter}[[[HiveInterface](https://pub.dev/documentation/hive/2.2.3/hive/HiveInterface-class.html)]{.type-annotation} [hive]{.parameter-name}]{#receiveMessage-param-hive .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Helper function to decrypt the message.

[[saveKeyPair](../utils_encryptor/Encryptor/saveKeyPair.html)]{.name}[([[[AsymmetricKeyPair](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/AsymmetricKeyPair-class.html)[\<[[PublicKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/PublicKey-class.html)]{.type-parameter}, [[PrivateKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/PrivateKey-class.html)]{.type-parameter}\>]{.signature}]{.type-annotation} [keyPair]{.parameter-name}, ]{#saveKeyPair-param-keyPair .parameter}[[[HiveInterface](https://pub.dev/documentation/hive/2.2.3/hive/HiveInterface-class.html)]{.type-annotation} [hive]{.parameter-name}]{#saveKeyPair-param-hive .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Saves the generated key pair to local storage.

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   A string representation of this object.
    ::: features
    [inherited]{.feature}
    :::
:::

::: {#operators .section .summary .offset-anchor .inherited}
## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)]{.name}[([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)]{.type-annotation} [other]{.parameter-name}]{#==-param-other .parameter}) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.returntype .parameter} ]{.signature}
:   The equality operator.
    ::: features
    [inherited]{.feature}
    :::
:::

::: {#static-properties .section .summary .offset-anchor}
## Static Properties

[[shouldEncrypt](../utils_encryptor/Encryptor/shouldEncrypt.html)]{.name} [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}
:   A global switch to flag the encryption.
    ::: features
    [getter/setter pair]{.feature}
    :::
:::

::: {#static-methods .section .summary .offset-anchor}
## Static Methods

[[encryptString](../utils_encryptor/Encryptor/encryptString.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [data]{.parameter-name}]{#encryptString-param-data .parameter}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   Encrypts a given string with SHA256 Encryption.
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [encryptor](../utils_encryptor/)
3.  Encryptor class

##### encryptor library

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
