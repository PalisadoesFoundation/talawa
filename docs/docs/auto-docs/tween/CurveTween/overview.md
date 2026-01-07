# Overview for `CurveTween`

## Description

Transforms the value of the given animation by the given curve.

 This class differs from [CurvedAnimation] in that [CurvedAnimation] applies
 a curve to an existing [Animation] object whereas [CurveTween] can be
 chained with another [Tween] prior to receiving the underlying [Animation].
 ([CurvedAnimation] also has the additional ability of having different
 curves when the animation is going forward vs when it is going backward,
 which can be useful in some scenarios.)

 

 The following code snippet shows how you can apply a curve to a linear
 animation produced by an [AnimationController] `controller`:

 ```dart
 final Animation&lt;double&gt; animation = _controller.drive(
   CurveTween(curve: Curves.ease),
 );
 ```
 

 See also:

  * [CurvedAnimation], for an alternative way of expressing the sample above.
  * [AnimationController], for examples of creating and disposing of an
    [AnimationController].

## Dependencies

- Animatable

## Members

- **curve**: `Curve`
  The curve to use when transforming the value of the animation.

## Constructors

### Unnamed Constructor
Creates a curve tween.

