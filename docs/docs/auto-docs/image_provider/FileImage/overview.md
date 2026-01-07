# Overview for `FileImage`

## Description

Decodes the given [File] object as an image, associating it with the given
 scale.

 The provider does not monitor the file for changes. If you expect the
 underlying data to change, you should call the [evict] method.

 See also:

  * [Image.file] for a shorthand of an [Image] widget backed by [FileImage].

## Dependencies

- ImageProvider

## Members

- **file**: `File`
  The file to decode into an image.

- **scale**: `double`
  The scale to place in the [ImageInfo] object of the image.

## Constructors

### Unnamed Constructor
Creates an object that decodes a [File] as an image.

