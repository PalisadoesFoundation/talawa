# Overview for `CurvedAnimation`

## Description

An animation that applies a curve to another animation.

 [CurvedAnimation] is useful when you want to apply a non-linear [Curve] to
 an animation object, especially if you want different curves when the
 animation is going forward vs when it is going backward.

 Depending on the given curve, the output of the [CurvedAnimation] could have
 a wider range than its input. For example, elastic curves such as
 [Curves.elasticIn] will significantly overshoot or undershoot the default
 range of 0.0 to 1.0.

 If you want to apply a [Curve] to a [Tween], consider using [CurveTween].

 

 The following code snippet shows how you can apply a curve to a linear
 animation produced by an [AnimationController] `controller`.

 ```dart
 final Animation&lt;double&gt; animation = CurvedAnimation(
   parent: controller,
   curve: Curves.ease,
 );
 ```
 
 

 This second code snippet shows how to apply a different curve in the forward
 direction than in the reverse direction. This can't be done using a
 [CurveTween] (since [Tween]s are not aware of the animation direction when
 they are applied).

 ```dart
 final Animation&lt;double&gt; animation = CurvedAnimation(
   parent: controller,
   curve: Curves.easeIn,
   reverseCurve: Curves.easeOut,
 );
 ```
 

 By default, the [reverseCurve] matches the forward [curve].

 See also:

  * [CurveTween], for an alternative way of expressing the first sample
    above.
  * [AnimationController], for examples of creating and disposing of an
    [AnimationController].
  * [Curve.flipped] and [FlippedCurve], which provide the reverse of a
    [Curve].

## Dependencies

- Animation, AnimationWithParentMixin

## Members

- **parent**: `Animation&lt;double&gt;`
  The animation to which this animation applies a curve.

- **curve**: `Curve`
  The curve to use in the forward direction.

- **reverseCurve**: `Curve?`
  The curve to use in the reverse direction.

 If the parent animation changes direction without first reaching the
 [AnimationStatus.completed] or [AnimationStatus.dismissed] status, the
 [CurvedAnimation] stays on the same curve (albeit in the opposite
 direction) to avoid visual discontinuities.

 If you use a non-null [reverseCurve], you might want to hold this object
 in a [State] object rather than recreating it each time your widget builds
 in order to take advantage of the state in this object that avoids visual
 discontinuities.

 If this field is null, uses [curve] in both directions.

- **_curveDirection**: `AnimationStatus?`
  The direction used to select the current curve.

 The curve direction is only reset when we hit the beginning or the end of
 the timeline to avoid discontinuities in the value of any variables this
 animation is used to animate.

- **isDisposed**: `bool`
  True if this CurvedAnimation has been disposed.

## Constructors

### Unnamed Constructor
Creates a curved animation.

