# Method: `removeErrorListener`

## Description

Stops listening for uncaught errors from the isolate.

 Requests for the isolate to not send uncaught errors on [port].
 If the isolate isn't expecting to send uncaught errors on [port],
 because the port hasn't been added using [addErrorListener],
 or because it has already been removed, the request is ignored.

 If the same port has been passed via [addErrorListener] more than once,
 only one call to `removeErrorListener` is needed to stop it from receiving
 uncaught errors.

 Uncaught errors message may still be sent by the isolate
 until this request is received and processed.

## Return Type
`void`

## Parameters

- `port`: `SendPort`
