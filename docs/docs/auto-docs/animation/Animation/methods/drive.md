# Method: `drive`

## Description

Chains a [Tween] (or [CurveTween]) to this [Animation].

 This method is only valid for `Animation&lt;double&gt;` instances (i.e. when `T`
 is `double`). This means, for instance, that it can be called on
 [AnimationController] objects, as well as [CurvedAnimation]s,
 [ProxyAnimation]s, [ReverseAnimation]s, [TrainHoppingAnimation]s, etc.

 It returns an [Animation] specialized to the same type, `U`, as the
 argument to the method (`child`), whose value is derived by applying the
 given [Tween] to the value of this [Animation].

 

 Given an [AnimationController] `_controller`, the following code creates
 an `Animation&lt;Alignment&gt;` that swings from top left to top right as the
 controller goes from 0.0 to 1.0:

 ```dart
 Animation&lt;Alignment&gt; alignment1 = _controller.drive(
   AlignmentTween(
     begin: Alignment.topLeft,
     end: Alignment.topRight,
   ),
 );
 ```
 
 

 The `alignment1.value` could then be used in a widget's build method, for
 instance, to position a child using an [Align] widget such that the
 position of the child shifts over time from the top left to the top right.

 It is common to ease this kind of curve, e.g. making the transition slower
 at the start and faster at the end. The following snippet shows one way to
 chain the alignment tween in the previous example to an easing curve (in
 this case, [Curves.easeIn]). In this example, the tween is created
 elsewhere as a variable that can be reused, since none of its arguments
 vary.

 ```dart
 final Animatable&lt;Alignment&gt; tween = AlignmentTween(begin: Alignment.topLeft, end: Alignment.topRight)
   .chain(CurveTween(curve: Curves.easeIn));
 // ...
 final Animation&lt;Alignment&gt; alignment2 = _controller.drive(tween);
 ```
 
 

 The following code is exactly equivalent, and is typically clearer when
 the tweens are created inline, as might be preferred when the tweens have
 values that depend on other variables:

 ```dart
 Animation&lt;Alignment&gt; alignment3 = _controller
   .drive(CurveTween(curve: Curves.easeIn))
   .drive(AlignmentTween(
     begin: Alignment.topLeft,
     end: Alignment.topRight,
   ));
 ```
 
 

 This method can be paired with an [Animatable] created via
 [Animatable.fromCallback] in order to transform an animation with a
 callback function. This can be useful for performing animations that
 do not have well defined start or end points. This example transforms
 the current scroll position into a color that cycles through values
 of red.

 ```dart
 Animation&lt;Color&gt; color = Animation&lt;double&gt;.fromValueListenable(_scrollPosition)
   .drive(Animatable&lt;Color&gt;.fromCallback((double value) ));
 ```

 

 See also:

  * [Animatable.animate], which does the same thing.
  * [AnimationController], which is usually used to drive animations.
  * [CurvedAnimation], an alternative to [CurveTween] for applying easing
    curves, which supports distinct curves in the forward direction and the
    reverse direction.
  * [Animatable.fromCallback], which allows creating an [Animatable] from an
    arbitrary transformation.

## Return Type
`Animation&lt;U&gt;`

## Parameters

- `child`: `Animatable&lt;U&gt;`
