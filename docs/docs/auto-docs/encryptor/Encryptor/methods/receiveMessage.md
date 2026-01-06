# Method: `receiveMessage`

## Description

Helper function to decrypt the message.

 Internally uses the [loadKeyPair] function to get private key and
 [assymetricDecryptString] to decrypt the given message.

 **params**:
 * `message`: Message object containing a field named [encryptedMessage]
 which is supposed to contained user's message in encrypted format.
 * `hive`: The [HiveInterface] to store things in.
 * `secureStorage`: Optional [FlutterSecureStorage] for storing the encryption key.

 **returns**:
   None

## Return Type
`Future&lt;void&gt;`

## Parameters

- `message`: `Map&lt;String, dynamic&gt;`
- `hive`: `HiveInterface`
- ``: `dynamic`
