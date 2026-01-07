# Overview for `RelativePositionedTransition`

## Description

Animated version of [Positioned] which transitions the child's position
 based on the value of [rect] relative to a bounding box with the
 specified [size].

 Only works if it's the child of a [Stack].

 Here's an illustration of the [RelativePositionedTransition] widget, with it's [rect]
 animated by a [CurvedAnimation] set to [Curves.elasticInOut]:
 

 
 The following code implements the [RelativePositionedTransition] as seen in the video
 above:

 ** See code in examples/api/lib/widgets/transitions/relative_positioned_transition.0.dart **
 

 See also:

  * [PositionedTransition], a widget that animates its child from a start
    position to an end position over the lifetime of the animation.
  * [AlignTransition], an animated version of an [Align] that animates its
    [Align.alignment] property.
  * [ScaleTransition], a widget that animates the scale of a transformed
    widget.
  * [SizeTransition], a widget that animates its own size and clips and
    aligns its child.
  * [SlideTransition], a widget that animates the position of a widget
    relative to its normal position.

## Dependencies

- AnimatedWidget

## Members

- **size**: `Size`
  The [Positioned] widget's offsets are relative to a box of this
 size whose origin is 0,0.

- **child**: `Widget`
  The widget below this widget in the tree.

 

## Constructors

### Unnamed Constructor
Create an animated version of [Positioned].

 Each frame, the [Positioned] widget will be configured to represent the
 current value of the [rect] argument assuming that the stack has the given
 [size].

