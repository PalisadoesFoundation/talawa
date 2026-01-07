# Method: `addOnExitListener`

## Description

Requests an exit message on [responsePort] when the isolate terminates.

 The isolate will send [response] as a message on [responsePort] as the last
 thing before it terminates. It will run no further code after the message
 has been sent.

 Adding the same port more than once will only cause it to receive one exit
 message, using the last response value that was added,
 and it only needs to be removed once using [removeOnExitListener].

 If the isolate has terminated before it can receive this request,
 no exit message will be sent.

 The [response] object must follow the same restrictions as enforced by
 [SendPort.send] when sending to an isolate from another isolate group;
 only simple values that can be sent to all isolates, like `null`,
 booleans, numbers or strings, are allowed.

 Since isolates run concurrently, it's possible for it to exit before the
 exit listener is established, and in that case no response will be
 sent on [responsePort].
 To avoid this, either use the corresponding parameter to the spawn
 function, or start the isolate paused, add the listener and
 then resume the isolate.

## Return Type
`void`

## Parameters

- `responsePort`: `SendPort`
- ``: `dynamic`
