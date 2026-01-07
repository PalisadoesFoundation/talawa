# Method: `ping`

## Description

Requests that the isolate send [response] on the [responsePort].

 The [response] object must follow the same restrictions as enforced by
 [SendPort.send] when sending to an isolate from another isolate group;
 only simple values that can be sent to all isolates, like `null`,
 booleans, numbers or strings, are allowed.

 If the isolate is alive, it will eventually send `response`
 (defaulting to `null`) on the response port.

 The [priority] must be one of [immediate] or [beforeNextEvent].
 The response is sent at different times depending on the ping type:

 * `immediate`: The isolate responds as soon as it receives the
     control message. This is after any previous control message
     from the same isolate has been received and processed,
     but may be during execution of another event.
 * `beforeNextEvent`: The response is scheduled for the next time
     control returns to the event loop of the receiving isolate,
     after the current event, and any already scheduled control events,
     are completed.

## Return Type
`void`

## Parameters

- `responsePort`: `SendPort`
- ``: `dynamic`
- ``: `dynamic`
