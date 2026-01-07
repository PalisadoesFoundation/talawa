# Overview for `AnimatedFractionallySizedBox`

## Description

Animated version of [FractionallySizedBox] which automatically transitions the
 child's size over a given duration whenever the given [widthFactor] or
 [heightFactor] changes, as well as the position whenever the given [alignment]
 changes.

 For the animation, you can choose a [curve] as well as a [duration] and the
 widget will automatically animate to the new target [widthFactor] or
 [heightFactor].

 
 The following example transitions an [AnimatedFractionallySizedBox]
 between two states. It adjusts the [heightFactor], [widthFactor], and
 [alignment] properties when tapped, using a [curve] of [Curves.fastOutSlowIn]

 ** See code in examples/api/lib/widgets/implicit_animations/animated_fractionally_sized_box.0.dart **
 

 See also:

  * [AnimatedAlign], which is an implicitly animated version of [Align].
  * [AnimatedContainer], which can transition more values at once.
  * [AnimatedSlide], which can animate the translation of child by a given offset relative to its size.
  * [AnimatedPositioned], which, as a child of a [Stack], automatically
    transitions its child's position over a given duration whenever the given
    position changes.

## Dependencies

- ImplicitlyAnimatedWidget

## Members

- **child**: `Widget?`
  The widget below this widget in the tree.

 

- **heightFactor**: `double?`
  

- **widthFactor**: `double?`
  

- **alignment**: `AlignmentGeometry`
  

## Constructors

### Unnamed Constructor
Creates a widget that sizes its child to a fraction of the total available
 space that animates implicitly, and positions its child by an alignment
 that animates implicitly.

 If non-null, the [widthFactor] and [heightFactor] arguments must be
 non-negative.

