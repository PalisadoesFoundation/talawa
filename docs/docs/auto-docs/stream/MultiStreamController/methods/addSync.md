# Method: `addSync`

## Description

Adds and delivers an event.

 Adds an event like [add] and attempts to deliver it immediately.
 Delivery can be delayed if other previously added events are
 still pending delivery, if the subscription is paused,
 or if the subscription isn't listening yet.

## Return Type
`void`

## Parameters

- `value`: `T`
