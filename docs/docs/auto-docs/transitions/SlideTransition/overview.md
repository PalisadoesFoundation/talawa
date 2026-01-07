# Overview for `SlideTransition`

## Description

Animates the position of a widget relative to its normal position.

 The translation is expressed as an [Offset] scaled to the child's size. For
 example, an [Offset] with a `dx` of 0.25 will result in a horizontal
 translation of one quarter the width of the child.

 By default, the offsets are applied in the coordinate system of the canvas
 (so positive x offsets move the child towards the right). If a
 [textDirection] is provided, then the offsets are applied in the reading
 direction, so in right-to-left text, positive x offsets move towards the
 left, and in left-to-right text, positive x offsets move towards the right.

 Here's an illustration of the [SlideTransition] widget, with its [position]
 animated by a [CurvedAnimation] set to [Curves.elasticIn]:
 

 
 The following code implements the [SlideTransition] as seen in the video
 above:

 ** See code in examples/api/lib/widgets/transitions/slide_transition.0.dart **
 

 See also:

  * [AlignTransition], an animated version of an [Align] that animates its
    [Align.alignment] property.
  * [PositionedTransition], a widget that animates its child from a start
    position to an end position over the lifetime of the animation.
  * [RelativePositionedTransition], a widget that transitions its child's
    position based on the value of a rectangle relative to a bounding box.

## Dependencies

- AnimatedWidget

## Members

- **textDirection**: `TextDirection?`
  The direction to use for the x offset described by the [position].

 If [textDirection] is null, the x offset is applied in the coordinate
 system of the canvas (so positive x offsets move the child towards the
 right).

 If [textDirection] is [TextDirection.rtl], the x offset is applied in the
 reading direction such that x offsets move the child towards the left.

 If [textDirection] is [TextDirection.ltr], the x offset is applied in the
 reading direction such that x offsets move the child towards the right.

- **transformHitTests**: `bool`
  Whether hit testing should be affected by the slide animation.

 If false, hit testing will proceed as if the child was not translated at
 all. Setting this value to false is useful for fast animations where you
 expect the user to commonly interact with the child widget in its final
 location and you want the user to benefit from "muscle memory".

- **child**: `Widget?`
  The widget below this widget in the tree.

 

## Constructors

### Unnamed Constructor
Creates a fractional translation transition.

