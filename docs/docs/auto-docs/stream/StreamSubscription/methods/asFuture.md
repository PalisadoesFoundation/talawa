# Method: `asFuture`

## Description

Returns a future that handles the [onDone] and [onError] callbacks.

 This method *overwrites* the existing [onDone] and [onError] callbacks
 with new ones that complete the returned future.

 In case of an error the subscription will automatically cancel (even
 when it was listening with `cancelOnError` set to `false`).

 In case of a `done` event the future completes with the given
 [futureValue].

 If [futureValue] is omitted, the value `null as E` is used as a default.
 If `E` is not nullable, this will throw immediately when [asFuture]
 is called.

## Return Type
`Future&lt;E&gt;`

## Parameters

- ``: `dynamic`
