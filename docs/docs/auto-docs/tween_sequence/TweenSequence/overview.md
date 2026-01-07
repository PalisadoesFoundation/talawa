# Overview for `TweenSequence`

## Description

Enables creating an [Animation] whose value is defined by a sequence of
 [Tween]s.

 Each [TweenSequenceItem] has a weight that defines its percentage of the
 animation's duration. Each tween defines the animation's value during the
 interval indicated by its weight.

 
 This example defines an animation that uses an easing curve to interpolate
 between 5.0 and 10.0 during the first 40% of the animation, remains at 10.0
 for the next 20%, and then returns to 5.0 for the final 40%.

 ```dart
 final Animation&lt;double&gt; animation = TweenSequence&lt;double&gt;(
   <TweenSequenceItem&lt;double>&gt;[
     TweenSequenceItem&lt;double&gt;(
       tween: Tween&lt;double&gt;(begin: 5.0, end: 10.0)
         .chain(CurveTween(curve: Curves.ease)),
       weight: 40.0,
     ),
     TweenSequenceItem&lt;double&gt;(
       tween: ConstantTween&lt;double&gt;(10.0),
       weight: 20.0,
     ),
     TweenSequenceItem&lt;double&gt;(
       tween: Tween&lt;double&gt;(begin: 10.0, end: 5.0)
         .chain(CurveTween(curve: Curves.ease)),
       weight: 40.0,
     ),
   ],
 ).animate(myAnimationController);
 ```
 

## Dependencies

- Animatable

## Members

- **_items**: `List&lt;TweenSequenceItem&lt;T&gt;&gt;`
- **_intervals**: `List&lt;_Interval&gt;`
## Constructors

### Unnamed Constructor
Construct a TweenSequence.

 The [items] parameter must be a list of one or more [TweenSequenceItem]s.

 There's a small cost associated with building a [TweenSequence] so it's
 best to reuse one, rather than rebuilding it on every frame, when that's
 possible.

