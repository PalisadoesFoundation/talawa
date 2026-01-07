# Overview for `AnimatedSize`

## Description

Animated widget that automatically transitions its size over a given
 duration whenever the given child's size changes.

 
 This example defines a widget that uses [AnimatedSize] to change the size of
 the [SizedBox] on tap.

 ** See code in examples/api/lib/widgets/animated_size/animated_size.0.dart **
 

 See also:

  * [SizeTransition], which changes its size based on an [Animation].

## Dependencies

- StatefulWidget

## Members

- **child**: `Widget?`
  The widget below this widget in the tree.

 

- **alignment**: `AlignmentGeometry`
  The alignment of the child within the parent when the parent is not yet
 the same size as the child.

 The x and y values of the alignment control the horizontal and vertical
 alignment, respectively. An x value of -1.0 means that the left edge of
 the child is aligned with the left edge of the parent whereas an x value
 of 1.0 means that the right edge of the child is aligned with the right
 edge of the parent. Other values interpolate (and extrapolate) linearly.
 For example, a value of 0.0 means that the center of the child is aligned
 with the center of the parent.

 Defaults to [Alignment.center].

 See also:

  * [Alignment], a class with convenient constants typically used to
    specify an [AlignmentGeometry].
  * [AlignmentDirectional], like [Alignment] for specifying alignments
    relative to text direction.

- **curve**: `Curve`
  The animation curve when transitioning this widget's size to match the
 child's size.

- **duration**: `Duration`
  The duration when transitioning this widget's size to match the child's
 size.

- **reverseDuration**: `Duration?`
  The duration when transitioning this widget's size to match the child's
 size when going in reverse.

 If not specified, defaults to [duration].

- **clipBehavior**: `Clip`
  

 Defaults to [Clip.hardEdge].

- **onEnd**: `VoidCallback?`
  Called every time an animation completes.

 This can be useful to trigger additional actions (e.g. another animation)
 at the end of the current animation.

## Constructors

### Unnamed Constructor
Creates a widget that animates its size to match that of its child.

