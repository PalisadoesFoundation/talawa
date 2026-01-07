# Method: `loadBuffer`

## Description

Converts a key into an [ImageStreamCompleter], and begins fetching the
 image.

 This method is deprecated. Implement [loadImage] instead.

 The [decode] callback provides the logic to obtain the codec for the
 image.

 See also:

  * [ResizeImage], for modifying the key to account for cache dimensions.

## Return Type
`ImageStreamCompleter`

## Parameters

- `key`: `T`
- `decode`: `DecoderBufferCallback`
