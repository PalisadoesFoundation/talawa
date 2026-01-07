# Method: `overwrite`

## Description

Overwrite the entire base mipmap level of this [Texture].

 This method can only be used if the [Texture] was created with
 [StorageMode.hostVisible]. An exception will be thrown otherwise.

 The length of [sourceBytes] must be exactly the size of the base mip
 level, otherwise an exception will be thrown. The size of the base mip
 level is always `width * height * bytesPerPixel`.

 Throws an exception if the write failed due to an internal error.

## Return Type
`void`

## Parameters

- `sourceBytes`: `ByteData`
