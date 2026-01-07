# Overview for `AlignTransition`

## Description

Animated version of an [Align] that animates its [Align.alignment] property.

 Here's an illustration of the [DecoratedBoxTransition] widget, with it's
 [DecoratedBoxTransition.decoration] animated by a [CurvedAnimation] set to
 [Curves.decelerate]:

 

 
 The following code implements the [AlignTransition] as seen in the video
 above:

 ** See code in examples/api/lib/widgets/transitions/align_transition.0.dart **
 

 See also:

  * [AnimatedAlign], which animates changes to the [alignment] without
    taking an explicit [Animation] argument.
  * [PositionedTransition], a widget that animates its child from a start
    position to an end position over the lifetime of the animation.
  * [RelativePositionedTransition], a widget that transitions its child's
    position based on the value of a rectangle relative to a bounding box.
  * [SizeTransition], a widget that animates its own size and clips and
    aligns its child.
  * [SlideTransition], a widget that animates the position of a widget
    relative to its normal position.

## Dependencies

- AnimatedWidget

## Members

- **widthFactor**: `double?`
  If non-null, the child's width factor, see [Align.widthFactor].

- **heightFactor**: `double?`
  If non-null, the child's height factor, see [Align.heightFactor].

- **child**: `Widget`
  The widget below this widget in the tree.

 

## Constructors

### Unnamed Constructor
Creates an animated [Align] whose [AlignmentGeometry] animation updates
 the widget.

 See also:

  * [Align.new].

