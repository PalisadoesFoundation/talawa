# Method: `saveKeyPair`

## Description

Saves the generated key pair to local storage.

 Any future usage of the keys must be initiated from here.

 **params**:
 * `keyPair`: [AsymmetricKeyPair] to save.
 * `hive`: The [HiveInterface] to store keys in.
 * `secureStorage`: Optional [FlutterSecureStorage] for storing the encryption key.

 **returns**:
   None

## Return Type
`Future<void>`

## Parameters

- `keyPair`: `AsymmetricKeyPair<PublicKey, PrivateKey>`
- `hive`: `HiveInterface`
- ``: `dynamic`
