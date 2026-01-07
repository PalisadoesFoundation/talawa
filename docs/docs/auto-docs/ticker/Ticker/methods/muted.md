# Method: `muted`

## Description

When set to true, silences the ticker, so that it is no longer ticking. If
 a tick is already scheduled, it will unschedule it. This will not
 unschedule the next frame, though.

 When set to false, unsilences the ticker, potentially scheduling a frame
 to handle the next tick.

 By convention, the [muted] property is controlled by the object that
 created the [Ticker] (typically a [TickerProvider]), not the object that
 listens to the ticker's ticks.

## Parameters

- `value`: `bool`
