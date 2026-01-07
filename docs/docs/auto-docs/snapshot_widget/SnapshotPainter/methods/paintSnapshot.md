# Method: `paintSnapshot`

## Description

Called whenever the [image] that represents a [SnapshotWidget]s child should be painted.

 The image is rasterized at the physical pixel resolution and should be scaled down by
 [pixelRatio] to account for device independent pixels.

 

 The following method shows how the default implementation of the delegate used by the
 [SnapshotPainter] paints the snapshot. This must account for the fact that the image
 width and height will be given in physical pixels, while the image must be painted with
 device independent pixels. That is, the width and height of the image is the widget and
 height of the provided `size`, multiplied by the `pixelRatio`. In addition, the actual
 size of the scene captured by the `image` is not `image.width` or `image.height`, but
 indeed `sourceSize`, because the former is a rounded inaccurate integer:

 ```dart
 void paint(PaintingContext context, Offset offset, Size size, ui.Image image, Size sourceSize, double pixelRatio) 
 ```
 

## Return Type
`void`

## Parameters

- `context`: `PaintingContext`
- `offset`: `Offset`
- `size`: `Size`
- `image`: `ui.Image`
- `sourceSize`: `Size`
- `pixelRatio`: `double`
