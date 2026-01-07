# Overview for `RenderImage`

## Description

An image in the render tree.

 The render image attempts to find a size for itself that fits in the given
 constraints and preserves the image's intrinsic aspect ratio.

 The image is painted using [paintImage], which describes the meanings of the
 various fields on this class in more detail.

## Dependencies

- RenderBox

## Members

- **_resolvedAlignment**: `Alignment?`
- **_flipHorizontally**: `bool?`
- **_image**: `ui.Image?`
- **debugImageLabel**: `String?`
  A string used to identify the source of the image.

- **_width**: `double?`
- **_height**: `double?`
- **_scale**: `double`
- **_colorFilter**: `ColorFilter?`
- **_color**: `Color?`
- **_opacity**: `Animation&lt;double&gt;?`
- **_filterQuality**: `FilterQuality`
- **_colorBlendMode**: `BlendMode?`
- **_fit**: `BoxFit?`
- **_alignment**: `AlignmentGeometry`
- **_repeat**: `ImageRepeat`
- **_centerSlice**: `Rect?`
- **_invertColors**: `bool`
- **_matchTextDirection**: `bool`
- **_textDirection**: `TextDirection?`
- **_isAntiAlias**: `bool`
## Constructors

### Unnamed Constructor
Creates a render box that displays an image.

 The [textDirection] argument must not be null if [alignment] will need
 resolving or if [matchTextDirection] is true.

