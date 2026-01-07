# Method: `addErrorSync`

## Description

Adds and delivers an error event.

 Adds an error like [addError] and attempts to deliver it immediately.
 Delivery can be delayed if other previously added events are
 still pending delivery, if the subscription is paused,
 or if the subscription isn't listening yet.

## Return Type
`void`

## Parameters

- `error`: `Object`
- ``: `dynamic`
