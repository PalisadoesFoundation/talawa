# Method: `fling`

## Description

Drives the animation with a spring (within [lowerBound] and [upperBound])
 and initial velocity.

 If velocity is positive, the animation will complete, otherwise it will
 dismiss. The velocity is specified in units per second. If the
 [SemanticsBinding.disableAnimations] flag is set, the velocity is somewhat
 arbitrarily multiplied by 200.

 The [springDescription] parameter can be used to specify a custom
 [SpringType.criticallyDamped] or [SpringType.overDamped] spring with which
 to drive the animation. By default, a [SpringType.criticallyDamped] spring
 is used. See [SpringDescription.withDampingRatio] for how to create a
 suitable [SpringDescription].

 The resulting spring simulation cannot be of type [SpringType.underDamped];
 such a spring would oscillate rather than fling.

 Returns a [TickerFuture] that completes when the animation is complete.

 The most recently returned [TickerFuture], if any, is marked as having been
 canceled, meaning the future never completes and its [TickerFuture.orCancel]
 derivative future completes with a [TickerCanceled] error.

## Return Type
`TickerFuture`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
