# Method: `isPaused`

## Description

Whether the [StreamSubscription] is currently paused.

 If there have been more calls to [pause] than to [resume] on this
 stream subscription, the subscription is paused, and this getter
 returns `true`.

 Returns `false` if the stream can currently emit events, or if
 the subscription has completed or been cancelled.

## Return Type
`bool`

