# Overview for `MagnifierDecoration`

## Description

The decorations to put around the loupe in a [RawMagnifier].

 See also:

  * [Decoration], a more general solution for [DecoratedBox].

## Members

- **opacity**: `double`
  The opacity of the magnifier and decorations around the magnifier.

 When this is 1.0, the magnified image shows in the [shape] of the
 magnifier. When this is less than 1.0, the magnified image is transparent
 and shows through the unmagnified background.

 Generally this is only useful for animating the magnifier in and out, as a
 transparent magnifier looks quite confusing.

- **shadows**: `List&lt;BoxShadow&gt;?`
  A list of shadows cast by the [shape].

 If the shadows are offset, consider setting [RawMagnifier.clipBehavior] to
 [Clip.hardEdge] (or similar) to ensure the shadow does not occlude the
 magnifier (the shadow is drawn above the magnifier).

 If the shadows are _not_ offset, consider using [BlurStyle.outer] in the
 shadows instead, to avoid having to introduce a clip.

 In the event that [shape] consists of a stack of borders, the shadow is
 drawn using the bounds of the last one.

 See also:

  * [kElevationToShadow], which defines some shadows for Material design.
    Those shadows use [BlurStyle.normal] and may need to be converted to
    [BlurStyle.outer] for use with [MagnifierDecoration].

- **shape**: `ShapeBorder`
  The shape of the magnifier and the outline (border) around it.

 Shapes can be stacked (using the `+` operator). In that case, the
 magnifier and shadow are drawn according to the outside edge of the last
 shape, with the borders painted on top.

## Constructors

### Unnamed Constructor
Constructs a [MagnifierDecoration].

 By default, [MagnifierDecoration] is a rectangular magnifier with no
 shadows, and fully opaque.

