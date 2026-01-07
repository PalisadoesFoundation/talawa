# Overview for `MemoryImage`

## Description

Decodes the given [Uint8List] buffer as an image, associating it with the
 given scale.

 The provided [bytes] buffer should not be changed after it is provided
 to a [MemoryImage]. To provide an [ImageStream] that represents an image
 that changes over time, consider creating a new subclass of [ImageProvider]
 whose [loadImage] method returns a subclass of [ImageStreamCompleter] that
 can handle providing multiple images.

 See also:

  * [Image.memory] for a shorthand of an [Image] widget backed by [MemoryImage].

## Dependencies

- ImageProvider

## Members

- **bytes**: `Uint8List`
  The bytes to decode into an image.

 The bytes represent encoded image bytes and can be encoded in any of the
 following supported image formats: 

 See also:

  * [PaintingBinding.instantiateImageCodecWithSize]

- **scale**: `double`
  The scale to place in the [ImageInfo] object of the image.

 See also:

  * [ImageInfo.scale], which gives more information on how this scale is
    applied.

## Constructors

### Unnamed Constructor
Creates an object that decodes a [Uint8List] buffer as an image.

