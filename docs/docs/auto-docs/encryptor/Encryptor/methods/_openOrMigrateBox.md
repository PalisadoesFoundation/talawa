# Method: `_openOrMigrateBox`

## Description

Opens the Hive box with encryption.

 If the box exists but is unencrypted (legacy), it migrates the data
 to a new encrypted box transparently.

 **params**:
 * `hive`: The [HiveInterface] instance.
 * `encryptionKey`: The 256-bit AES encryption key.

 **returns**:
 * `Future&lt;Box&lt;AsymetricKeys&gt;&gt;`: Opened and encrypted Hive box.

## Return Type
`Future&lt;Box&lt;AsymetricKeys&gt;&gt;`

## Parameters

- `hive`: `HiveInterface`
- `encryptionKey`: `List&lt;int&gt;`
