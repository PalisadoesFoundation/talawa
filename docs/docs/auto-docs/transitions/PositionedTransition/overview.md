# Overview for `PositionedTransition`

## Description

Animated version of [Positioned] which takes a specific
 [Animation&lt;RelativeRect&gt;] to transition the child's position from a start
 position to an end position over the lifetime of the animation.

 Only works if it's the child of a [Stack].

 Here's an illustration of the [PositionedTransition] widget, with it's [rect]
 animated by a [CurvedAnimation] set to [Curves.elasticInOut]:
 

 
 The following code implements the [PositionedTransition] as seen in the video
 above:

 ** See code in examples/api/lib/widgets/transitions/positioned_transition.0.dart **
 

 See also:

  * [AnimatedPositioned], which transitions a child's position without
    taking an explicit [Animation] argument.
  * [RelativePositionedTransition], a widget that transitions its child's
    position based on the value of a rectangle relative to a bounding box.
  * [SlideTransition], a widget that animates the position of a widget
    relative to its normal position.
  * [AlignTransition], an animated version of an [Align] that animates its
    [Align.alignment] property.
  * [ScaleTransition], a widget that animates the scale of a transformed
    widget.
  * [SizeTransition], a widget that animates its own size and clips and
    aligns its child.

## Dependencies

- AnimatedWidget

## Members

- **child**: `Widget`
  The widget below this widget in the tree.

 

## Constructors

### Unnamed Constructor
Creates a transition for [Positioned].

