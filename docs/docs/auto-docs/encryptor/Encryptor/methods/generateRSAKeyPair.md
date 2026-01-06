# Method: `generateRSAKeyPair`

## Description

Generates RSA Key Pairs (Public/Private).

 Should be called only during app's first initialization,
 and any future usage should be done by getting the keys
 from the local storage.

 **params**:
   None

 **returns**:
 * `AsymmetricKeyPair&lt;PublicKey, PrivateKey&gt;`: The generated
 public and private keys.

## Return Type
`AsymmetricKeyPair&lt;PublicKey, PrivateKey&gt;`

