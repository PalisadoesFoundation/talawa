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
`Future&lt;void&gt;`

## Parameters

- `keyPair`: `AsymmetricKeyPair&lt;PublicKey, PrivateKey&gt;`
- `hive`: `HiveInterface`
- ``: `dynamic`
