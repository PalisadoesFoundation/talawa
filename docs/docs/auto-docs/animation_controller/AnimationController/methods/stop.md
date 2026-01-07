# Method: `stop`

## Description

Stops running this animation.

 This does not trigger any notifications. The animation stops in its
 current state.

 By default, the most recently returned [TickerFuture] is marked as having
 been canceled, meaning the future never completes and its
 [TickerFuture.orCancel] derivative future completes with a [TickerCanceled]
 error. By passing the `canceled` argument with the value false, this is
 reversed, and the futures complete successfully.

 See also:

  * [reset], which stops the animation and resets it to the [lowerBound],
    and which does send notifications.
  * [forward], [reverse], [animateTo], [animateWith], [fling], and [repeat],
    which restart the animation controller.

## Return Type
`void`

## Parameters

- ``: `dynamic`
