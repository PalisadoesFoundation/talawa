# Method: `toImage`

## Description

Capture an image of the current state of this layer and its children.

 The returned [ui.Image] has uncompressed raw RGBA bytes, will be offset
 by the top-left corner of [bounds], and have dimensions equal to the size
 of [bounds] multiplied by [pixelRatio].

 The [pixelRatio] describes the scale between the logical pixels and the
 size of the output image. It is independent of the
 [dart:ui.FlutterView.devicePixelRatio] for the device, so specifying 1.0
 (the default) will give you a 1:1 mapping between logical pixels and the
 output pixels in the image.

 This API functions like [toImageSync], except that it only returns after
 rasterization is complete.

 See also:

  * [RenderRepaintBoundary.toImage] for a similar API at the render object level.
  * [dart:ui.Scene.toImage] for more information about the image returned.

## Return Type
`Future<ui.Image>`

## Parameters

- `bounds`: `Rect`
- ``: `dynamic`
