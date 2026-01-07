# Method: `toImageSync`

## Description

Capture an image of the current state of this render object and its
 children synchronously.

 The returned [ui.Image] has uncompressed raw RGBA bytes in the dimensions
 of the render object, multiplied by the [pixelRatio].

 To use [toImageSync], the render object must have gone through the paint phase
 (i.e. [debugNeedsPaint] must be false).

 The [pixelRatio] describes the scale between the logical pixels and the
 size of the output image. It is independent of the
 [dart:ui.FlutterView.devicePixelRatio] for the device, so specifying 1.0
 (the default) will give you a 1:1 mapping between logical pixels and the
 output pixels in the image.

 This API functions like [toImage], except that rasterization begins eagerly
 on the raster thread and the image is returned before this is completed.

 

 The following is an example of how to go from a `GlobalKey` on a
 `RepaintBoundary` to an image handle:

 ```dart
 class ImageCaptureHome extends StatefulWidget 

 class _ImageCaptureHomeState extends State&lt;ImageCaptureHome&gt; 
 ```
 

 See also:

  * [OffsetLayer.toImageSync] for a similar API at the layer level.
  * [dart:ui.Scene.toImageSync] for more information about the image returned.

## Return Type
`ui.Image`

## Parameters

- ``: `dynamic`
