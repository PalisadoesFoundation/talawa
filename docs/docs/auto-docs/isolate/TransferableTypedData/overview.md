# Overview for `TransferableTypedData`

## Description

An efficiently transferable sequence of byte values.

 A [TransferableTypedData] is created from a number of bytes.
 This will take time proportional to the number of bytes.

 The [TransferableTypedData] can be moved between isolates, so
 sending it through a send port will only take constant time.

 When sent this way, the local transferable can no longer be materialized,
 and the received object is now the only way to materialize the data.

## Constructors

### fromList
Creates a new [TransferableTypedData] containing the bytes of [list].

 It must be possible to create a single [Uint8List] containing the
 bytes, so if there are more bytes than what the platform allows in
 a single [Uint8List], then creation fails.

#### Parameters

- `list`: `List&lt;TypedData&gt;`
