# Method: `loadImage`

## Description

Converts a key into an [ImageStreamCompleter], and begins fetching the
 image.

 For backwards-compatibility the default implementation of this method returns
 an object that will cause [resolveStreamForKey] to consult [loadBuffer].
 However, implementors of this interface should only override this method
 and not [loadBuffer], which is deprecated.

 The [decode] callback provides the logic to obtain the codec for the
 image.

 See also:

  * [ResizeImage], for modifying the key to account for cache dimensions.

## Return Type
`ImageStreamCompleter`

## Parameters

- `key`: `T`
- `decode`: `ImageDecoderCallback`
