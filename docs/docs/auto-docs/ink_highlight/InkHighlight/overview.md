# Overview for `InkHighlight`

## Description

A visual emphasis on a part of a [Material] receiving user interaction.

 This object is rarely created directly. Instead of creating an ink highlight
 directly, consider using an [InkResponse] or [InkWell] widget, which uses
 gestures (such as tap and long-press) to trigger ink highlights.

 See also:

  * [InkResponse], which uses gestures to trigger ink highlights and ink
    splashes in the parent [Material].
  * [InkWell], which is a rectangular [InkResponse] (the most common type of
    ink response).
  * [Material], which is the widget on which the ink highlight is painted.
  * [InkSplash], which is an ink feature that shows a reaction to user input
    on a [Material].
  * [Ink], a convenience widget for drawing images and other decorations on
    Material widgets.

## Dependencies

- InteractiveInkFeature

## Members

- **_shape**: `BoxShape`
- **_radius**: `double?`
- **_borderRadius**: `BorderRadius`
- **_rectCallback**: `RectCallback?`
- **_textDirection**: `TextDirection`
- **_alpha**: `Animation&lt;int&gt;`
- **_alphaController**: `AnimationController`
- **_active**: `bool`
## Constructors

### Unnamed Constructor
Begin a highlight animation.

 The [controller] argument is typically obtained via
 `Material.of(context)`.

 If a `rectCallback` is given, then it provides the highlight rectangle,
 otherwise, the highlight rectangle is coincident with the [referenceBox].

 When the highlight is removed, `onRemoved` will be called.

