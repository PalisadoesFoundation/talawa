# Method: `kill`

## Description

Requests the isolate to shut down.

 The isolate is requested to terminate itself.
 The [priority] argument specifies when this must happen.

 The [priority], when provided, must be one of [immediate] or
 [beforeNextEvent] (the default).
 The shutdown is performed at different times depending on the priority:

 * `immediate`: The isolate shuts down as soon as possible.
     Control messages are handled in order, so all previously sent control
     events from this isolate will all have been processed.
     The shutdown should happen no later than if sent with
     `beforeNextEvent`.
     It may happen earlier if the system has a way to shut down cleanly
     at an earlier time, even during the execution of another event.
 * `beforeNextEvent`: The shutdown is scheduled for the next time
     control returns to the event loop of the receiving isolate,
     after the current event, and any already scheduled control events,
     are completed.

 If [terminateCapability] is `null`, or it's not the terminate capability
 of the isolate identified by [controlPort],
 the kill request is ignored by the receiving isolate.

## Return Type
`void`

## Parameters

- ``: `dynamic`
