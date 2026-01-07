# Overview for `ImageChunkEvent`

## Description

An immutable notification of image bytes that have been incrementally loaded.

 Chunk events represent progress notifications while an image is being
 loaded (e.g. from disk or over the network).

 See also:

  * [ImageChunkListener], the means by which callers get notified of
    these events.

## Dependencies

- Diagnosticable

## Members

- **cumulativeBytesLoaded**: `int`
  The number of bytes that have been received across the wire thus far.

- **expectedTotalBytes**: `int?`
  The expected number of bytes that need to be received to finish loading
 the image.

 This value is not necessarily equal to the expected _size_ of the image
 in bytes, as the bytes required to load the image may be compressed.

 This value will be null if the number is not known in advance.

 When this value is null, the chunk event may still be useful as an
 indication that data is loading (and how much), but it cannot represent a
 loading completion percentage.

## Constructors

### Unnamed Constructor
Creates a new chunk event.

