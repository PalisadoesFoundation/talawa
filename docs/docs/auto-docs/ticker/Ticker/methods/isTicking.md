# Method: `isTicking`

## Description

Whether this [Ticker] has scheduled a call to call its callback
 on the next frame.

 A ticker that is [muted] can be active (see [isActive]) yet not be
 ticking. In that case, the ticker will not call its callback, and
 [isTicking] will be false, but time will still be progressing.

 This will return false if the [SchedulerBinding.lifecycleState] is one
 that indicates the application is not currently visible (e.g. if the
 device's screen is turned off).

## Return Type
`bool`

