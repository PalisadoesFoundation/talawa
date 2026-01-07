# Method: `didUpdateTweens`

## Description

Optional hook for subclasses that runs after all tweens have been updated
 via [forEachTween].

 Any properties that depend upon tweens created by [forEachTween] should be
 updated within [didUpdateTweens], not within [forEachTween].

 This method will be called both:

  1. After the tweens are _initially_ constructed (by
     the `constructor` argument to the [TweenVisitor] that's passed to
     [forEachTween]). In this case, the tweens are likely to contain only
     a [Tween.begin] value and not a [Tween.end].

  2. When the state's [widget] is updated, and one or more of the tweens
     visited by [forEachTween] specifies a target value that's different
     than the widget's current value, thus signaling that the [animation]
     should run. In this case, the [Tween.begin] value for each tween will
     an evaluation of the tween against the current [animation], and the
     [Tween.end] value for each tween will be the target value.

## Return Type
`void`

