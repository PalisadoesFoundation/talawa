# Overview for `ColorFiltered`

## Description

Applies a [ColorFilter] to its child.

 This widget applies a function independently to each pixel of [child]'s
 content, according to the [ColorFilter] specified.
 Use the [ColorFilter.mode] constructor to apply a [Color] using a [BlendMode].
 Use the [BackdropFilter] widget instead, if the [ColorFilter]
 needs to be applied onto the content beneath [child].

 

 
 These two images have two [ColorFilter]s applied with different [BlendMode]s,
 one with red color and [BlendMode.modulate] another with a grey color and [BlendMode.saturation].

 ** See code in examples/api/lib/widgets/color_filter/color_filtered.0.dart **


 See also:

  * [BlendMode], describes how to blend a source image with the destination image.
  * [ColorFilter], which describes a function that modify a color to a different color.

## Dependencies

- SingleChildRenderObjectWidget

## Members

- **colorFilter**: `ColorFilter`
  The color filter to apply to the child of this widget.

## Constructors

### Unnamed Constructor
Creates a widget that applies a [ColorFilter] to its child.

