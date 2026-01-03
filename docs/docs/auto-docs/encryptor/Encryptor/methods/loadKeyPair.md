# Method: `loadKeyPair`

## Description

Loads secret keys from the Hive db.

 **params**:
 * `hive`: The [HiveInterface] to load keys from.
 * `secureStorage`: Optional [FlutterSecureStorage] for storing the encryption key.

 **returns**:
 * `Future<AsymmetricKeyPair<PublicKey, PrivateKey>>`: The public and
 private key pair

## Return Type
`Future<AsymmetricKeyPair<PublicKey, PrivateKey>>`

## Parameters

- `hive`: `HiveInterface`
- ``: `dynamic`
