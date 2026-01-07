# Overview for `ImageFiltered`

## Description

Applies an [ImageFilter] to its child.

 An image filter will always apply its filter operation to the child widget,
 even if said filter is conceptually a "no-op", such as an ImageFilter.blur
 with a radius of 0 or an ImageFilter.matrix with an identity matrix. Setting
 [ImageFiltered.enabled] to `false` is a more efficient manner of disabling
 an image filter.

 The framework does not attempt to optimize out "no-op" filters because it
 cannot tell the difference between an intentional no-op and a filter that is
 only incidentally a no-op. Consider an ImageFilter.matrix that is animated
 and happens to pass through the identity matrix. If the framework identified it
 as a no-op it would drop and then recreate the layer during the animation which
 would be more expensive than keeping it around.

 

 See also:

 * [BackdropFilter], which applies an [ImageFilter] to everything
   beneath its child.
 * [ColorFiltered], which applies a [ColorFilter] to its child.

## Dependencies

- SingleChildRenderObjectWidget

## Members

- **imageFilter**: `ImageFilter`
  The image filter to apply to the child of this widget.

- **enabled**: `bool`
  Whether or not to apply the image filter operation to the child of this
 widget.

 Prefer setting enabled to `false` instead of creating a "no-op" filter
 type for performance reasons.

## Constructors

### Unnamed Constructor
Creates a widget that applies an [ImageFilter] to its child.

