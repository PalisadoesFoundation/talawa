# Overview for `AnimatedAlign`

## Description

Animated version of [Align] which automatically transitions the child's
 position over a given duration whenever the given [alignment] changes.

 Here's an illustration of what this can look like, using a [curve] of
 [Curves.fastOutSlowIn].
 

 For the animation, you can choose a [curve] as well as a [duration] and the
 widget will automatically animate to the new target [alignment]. If you require
 more control over the animation (e.g. if you want to stop it mid-animation),
 consider using an [AlignTransition] instead, which takes a provided
 [Animation] as argument. While that allows you to fine-tune the animation,
 it also requires more development overhead as you have to manually manage
 the lifecycle of the underlying [AnimationController].

 
 The following code implements the [AnimatedAlign] widget, using a [curve] of
 [Curves.fastOutSlowIn].

 ** See code in examples/api/lib/widgets/implicit_animations/animated_align.0.dart **
 

 See also:

  * [AnimatedContainer], which can transition more values at once.
  * [AnimatedPadding], which can animate the padding instead of the
    alignment.
  * [AnimatedSlide], which can animate the translation of child by a given offset relative to its size.
  * [AnimatedPositioned], which, as a child of a [Stack], automatically
    transitions its child's position over a given duration whenever the given
    position changes.

## Dependencies

- ImplicitlyAnimatedWidget

## Members

- **alignment**: `AlignmentGeometry`
  How to align the child.

 The x and y values of the [Alignment] control the horizontal and vertical
 alignment, respectively. An x value of -1.0 means that the left edge of
 the child is aligned with the left edge of the parent whereas an x value
 of 1.0 means that the right edge of the child is aligned with the right
 edge of the parent. Other values interpolate (and extrapolate) linearly.
 For example, a value of 0.0 means that the center of the child is aligned
 with the center of the parent.

 See also:

  * [Alignment], which has more details and some convenience constants for
    common positions.
  * [AlignmentDirectional], which has a horizontal coordinate orientation
    that depends on the [TextDirection].

- **child**: `Widget?`
  The widget below this widget in the tree.

 

- **heightFactor**: `double?`
  If non-null, sets its height to the child's height multiplied by this factor.

 Must be greater than or equal to 0.0, defaults to null.

- **widthFactor**: `double?`
  If non-null, sets its width to the child's width multiplied by this factor.

 Must be greater than or equal to 0.0, defaults to null.

## Constructors

### Unnamed Constructor
Creates a widget that positions its child by an alignment that animates
 implicitly.

