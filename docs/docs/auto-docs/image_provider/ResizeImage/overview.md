# Overview for `ResizeImage`

## Description

Instructs Flutter to decode the image at the specified dimensions
 instead of at its native size.

 This allows finer control of the size of the image in [ImageCache] and is
 generally used to reduce the memory footprint of [ImageCache].

 The decoded image may still be displayed at sizes other than the
 cached size provided here.

 The [width] and [height] parameters determine the image resolution.
 These values also set the image's width & height in logical pixels
 if it is unconstrained.

 
 This example shows how to size the image to half of the screen's width.

 ```dart
    Image(
      image: ResizeImage(
        FileImage(File('path/to/image')),
        width: MediaQuery.sizeOf(context).width ~/ 2, // Half of the screen's width.
      ),
    );
 ```
 

 See also:

  * [ui.FlutterView.devicePixelRatio], used to convert between physical and
    logical pixels.

## Dependencies

- ImageProvider

## Members

- **imageProvider**: `ImageProvider`
  The [ImageProvider] that this class wraps.

- **width**: `int?`
  The width the image should decode to and cache.

 At least one of this and [height] must be non-null.

- **height**: `int?`
  The height the image should decode to and cache.

 At least one of this and [width] must be non-null.

- **policy**: `ResizeImagePolicy`
  The policy that determines how [width] and [height] are interpreted.

 Defaults to [ResizeImagePolicy.exact].

- **allowUpscaling**: `bool`
  Whether the [width] and [height] parameters should be clamped to the
 intrinsic width and height of the image.

 In general, it is better for memory usage to avoid scaling the image
 beyond its intrinsic dimensions when decoding it. If there is a need to
 scale an image larger, it is better to apply a scale to the canvas, or
 to use an appropriate [Image.fit].

## Constructors

### Unnamed Constructor
Creates an ImageProvider that decodes the image to the specified size.

 The cached image will be directly decoded and stored at the resolution
 defined by `width` and `height`. The image will lose detail and
 use less memory if resized to a size smaller than the native size.

 At least one of `width` and `height` must be non-null.

