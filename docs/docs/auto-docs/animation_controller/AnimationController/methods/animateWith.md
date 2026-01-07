# Method: `animateWith`

## Description

Drives the animation according to the given simulation.

 
 The values from the simulation are clamped to the [lowerBound] and
 [upperBound]. To avoid this, consider creating the [AnimationController]
 using the [AnimationController.unbounded] constructor.

 Returns a [TickerFuture] that completes when the animation is complete.

 The most recently returned [TickerFuture], if any, is marked as having been
 canceled, meaning the future never completes and its [TickerFuture.orCancel]
 derivative future completes with a [TickerCanceled] error.
 

 The [status] is always [AnimationStatus.forward] for the entire duration
 of the simulation.

 See also:

  * [animateBackWith], which is like this method but the status is always
    [AnimationStatus.reverse].

## Return Type
`TickerFuture`

## Parameters

- `simulation`: `Simulation`
