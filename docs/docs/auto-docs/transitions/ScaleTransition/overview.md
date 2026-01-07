# Overview for `ScaleTransition`

## Description

Animates the scale of a transformed widget.

 Here's an illustration of the [ScaleTransition] widget, with it's [scale]
 animated by a [CurvedAnimation] set to [Curves.fastOutSlowIn]:
 

 
 The following code implements the [ScaleTransition] as seen in the video
 above:

 ** See code in examples/api/lib/widgets/transitions/scale_transition.0.dart **
 

 See also:

  * [PositionedTransition], a widget that animates its child from a start
    position to an end position over the lifetime of the animation.
  * [RelativePositionedTransition], a widget that transitions its child's
    position based on the value of a rectangle relative to a bounding box.
  * [SizeTransition], a widget that animates its own size and clips and
    aligns its child.

## Dependencies

- MatrixTransition

## Constructors

### Unnamed Constructor
Creates a scale transition.

 The [alignment] argument defaults to [Alignment.center].

