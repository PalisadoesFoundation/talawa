# Method: `drain`

## Description

Discards all data on this stream, but signals when it is done or an error
 occurred.

 When subscribing using [drain], cancelOnError will be true. This means
 that the future will complete with the first error on this stream and then
 cancel the subscription.

 If this stream emits an error, the returned future is completed with
 that error, and processing is stopped.

 In case of a `done` event the future completes with the given
 [futureValue].

 The [futureValue] must not be omitted if `null` is not assignable to [E].

 Example:
 ```dart
 final result = await Stream.fromIterable([1, 2, 3]).drain(100);
 print(result); // Outputs: 100.
 ```

## Return Type
`Future&lt;E&gt;`

## Parameters

- ``: `dynamic`
