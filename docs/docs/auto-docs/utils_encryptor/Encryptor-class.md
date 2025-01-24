




Encryptor class - encryptor library - Dart API







menu

1. [talawa](../index.html)
2. [utils/encryptor.dart](../utils_encryptor/utils_encryptor-library.html)
3. Encryptor class

Encryptor


dark\_mode

light\_mode




# Encryptor class


Handles all of the encryption tasks in the codebase.


## Constructors

[Encryptor](../utils_encryptor/Encryptor/Encryptor.html)()




## Properties

[hashCode](../utils_encryptor/Encryptor/hashCode.html)
→ int

The hash code for this object.
no setterinherited

[runtimeType](../utils_encryptor/Encryptor/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited



## Methods

[assymetricDecryptString](../utils_encryptor/Encryptor/assymetricDecryptString.html)(String data, [RSAPrivateKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/RSAPrivateKey-class.html) privateKey)
→ String


Encrypts the given string data with user's Private Key.

[assymetricEncryptString](../utils_encryptor/Encryptor/assymetricEncryptString.html)(String data, [RSAPublicKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/RSAPublicKey-class.html) recipientPublicKey)
→ String


Encrypts the given string data with Recipient's Public Key.

[generateRSAKeyPair](../utils_encryptor/Encryptor/generateRSAKeyPair.html)()
→ [AsymmetricKeyPair](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/AsymmetricKeyPair-class.html)<[PublicKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/PublicKey-class.html), [PrivateKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/PrivateKey-class.html)>


Generates RSA Key Pairs (Public/Private).

[loadKeyPair](../utils_encryptor/Encryptor/loadKeyPair.html)([HiveInterface](https://pub.dev/documentation/hive/2.2.3/hive/HiveInterface-class.html) hive)
→ Future<[AsymmetricKeyPair](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/AsymmetricKeyPair-class.html)<[PublicKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/PublicKey-class.html), [PrivateKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/PrivateKey-class.html)>>


Loads secret keys from the Hive db.

[noSuchMethod](../utils_encryptor/Encryptor/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[receiveMessage](../utils_encryptor/Encryptor/receiveMessage.html)(Map<String, dynamic> message, [HiveInterface](https://pub.dev/documentation/hive/2.2.3/hive/HiveInterface-class.html) hive)
→ Future<void>


Helper function to decrypt the message.

[saveKeyPair](../utils_encryptor/Encryptor/saveKeyPair.html)([AsymmetricKeyPair](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/AsymmetricKeyPair-class.html)<[PublicKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/PublicKey-class.html), [PrivateKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/PrivateKey-class.html)> keyPair, [HiveInterface](https://pub.dev/documentation/hive/2.2.3/hive/HiveInterface-class.html) hive)
→ Future<void>


Saves the generated key pair to local storage.

[toString](../utils_encryptor/Encryptor/toString.html)()
→ String


A string representation of this object.
inherited



## Operators

[operator ==](../utils_encryptor/Encryptor/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



## Static Properties

[shouldEncrypt](../utils_encryptor/Encryptor/shouldEncrypt.html)
↔ bool

A global switch to flag the encryption.
getter/setter pair



## Static Methods

[encryptString](../utils_encryptor/Encryptor/encryptString.html)(String data)
→ String


Encrypts a given string with SHA256 Encryption.



 


1. [talawa](../index.html)
2. [encryptor](../utils_encryptor/utils_encryptor-library.html)
3. Encryptor class

##### encryptor library





talawa
1.0.0+1






