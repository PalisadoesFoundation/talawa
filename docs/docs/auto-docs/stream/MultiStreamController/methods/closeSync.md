# Method: `closeSync`

## Description

Closes the controller and delivers a done event.

 Closes the controller like [close] and attempts to deliver a "done"
 event immediately.
 Delivery can be delayed if other previously added events are
 still pending delivery, if the subscription is paused,
 or if the subscription isn't listening yet.
 If it's necessary to know whether the "done" event has been delivered,
 [done] future will complete when that has happened.

## Return Type
`void`

