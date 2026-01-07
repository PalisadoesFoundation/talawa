# Overview for `MatrixTransition`

## Description

Animates the [Matrix4] of a transformed widget.

 The [onTransform] callback computes a [Matrix4] from the animated value, it
 is called every time the [animation] changes its value.

 
 The following example implements a [MatrixTransition] with a rotation around
 the Y axis, with a 3D perspective skew.

 ** See code in examples/api/lib/widgets/transitions/matrix_transition.0.dart **
 

 See also:

  * [ScaleTransition], which animates the scale of a widget, by providing a
    matrix which scales along the X and Y axis.
  * [RotationTransition], which animates the rotation of a widget, by
    providing a matrix which rotates along the Z axis.

## Dependencies

- AnimatedWidget

## Members

- **onTransform**: `TransformCallback`
  The callback to compute a [Matrix4] from the [animation]. It's called
 every time [animation] changes its value.

- **alignment**: `Alignment`
  The alignment of the origin of the coordinate system in which the
 transform takes place, relative to the size of the box.

 For example, to set the origin of the transform to bottom middle, you can
 use an alignment of (0.0, 1.0).

- **filterQuality**: `FilterQuality?`
  The filter quality with which to apply the transform as a bitmap operation.

 When the animation is stopped (either in [AnimationStatus.dismissed] or
 [AnimationStatus.completed]), the filter quality argument will be ignored.

 

- **child**: `Widget?`
  The widget below this widget in the tree.

 

## Constructors

### Unnamed Constructor
Creates a matrix transition.

 The [alignment] argument defaults to [Alignment.center].

