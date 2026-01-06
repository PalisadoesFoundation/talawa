# Method: `loadKeyPair`

## Description

Loads secret keys from the Hive db.

 **params**:
 * `hive`: The [HiveInterface] to load keys from.
 * `secureStorage`: Optional [FlutterSecureStorage] for storing the encryption key.

 **returns**:
 * `Future&lt;AsymmetricKeyPair&lt;PublicKey, PrivateKey&gt;&gt;`: The public and
 private key pair

## Return Type
`Future&lt;AsymmetricKeyPair&lt;PublicKey, PrivateKey&gt;&gt;`

## Parameters

- `hive`: `HiveInterface`
- ``: `dynamic`
