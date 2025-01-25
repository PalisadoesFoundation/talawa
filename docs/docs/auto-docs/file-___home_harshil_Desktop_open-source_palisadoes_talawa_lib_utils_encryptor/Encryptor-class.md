




Encryptor class - encryptor library - Dart API







menu

1. [talawa](../index.html)
2. [utils/encryptor.dart](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_encryptor/)
3. Encryptor class

Encryptor


dark\_mode

light\_mode




# Encryptor class


Handles all of the encryption tasks in the codebase.


## Constructors

[Encryptor](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_encryptor/Encryptor/Encryptor.html)()




## Properties

[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)
→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)

The hash code for this object.
no setterinherited

[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)
→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)

A representation of the runtime type of the object.
no setterinherited



## Methods

[assymetricDecryptString](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_encryptor/Encryptor/assymetricDecryptString.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) data, dynamic privateKey)
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


Encrypts the given string data with user's Private Key.

[assymetricEncryptString](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_encryptor/Encryptor/assymetricEncryptString.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) data, dynamic recipientPublicKey)
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


Encrypts the given string data with Recipient's Public Key.

[generateRSAKeyPair](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_encryptor/Encryptor/generateRSAKeyPair.html)()
→ dynamic


Generates RSA Key Pairs (Public/Private).

[loadKeyPair](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_encryptor/Encryptor/loadKeyPair.html)(dynamic hive)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)


Loads secret keys from the Hive db.

[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[receiveMessage](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_encryptor/Encryptor/receiveMessage.html)([Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> message, dynamic hive)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Helper function to decrypt the message.

[saveKeyPair](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_encryptor/Encryptor/saveKeyPair.html)(dynamic keyPair, dynamic hive)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Saves the generated key pair to local storage.

[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)()
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


A string representation of this object.
inherited



## Operators

[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other)
→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)


The equality operator.
inherited



## Static Properties

[shouldEncrypt](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_encryptor/Encryptor/shouldEncrypt.html)
↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)

A global switch to flag the encryption.
getter/setter pair



## Static Methods

[encryptString](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_encryptor/Encryptor/encryptString.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) data)
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


Encrypts a given string with SHA256 Encryption.



 


1. [talawa](../index.html)
2. [encryptor](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_encryptor/)
3. Encryptor class

##### encryptor library





talawa
1.0.0+1






