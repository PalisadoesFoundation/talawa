# Method: `materialize`

## Description

Creates a new [ByteBuffer] containing the bytes stored in this [TransferableTypedData].

 The [TransferableTypedData] is a cross-isolate single-use resource.
 This method must not be called more than once on the same underlying
 transferable bytes, even if the calls occur in different isolates.

## Return Type
`ByteBuffer`

