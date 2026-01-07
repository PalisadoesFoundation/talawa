# Method: `handleError`

## Description

Creates a wrapper Stream that intercepts some errors from this stream.

 If this stream sends an error that matches [test], then it is intercepted
 by the [onError] function.

 The [onError] callback must be of type `void Function(Object error)` or
 `void Function(Object error, StackTrace)`.
 The function type determines whether [onError] is invoked with a stack
 trace argument.
 The stack trace argument may be [StackTrace.empty] if this stream received
 an error without a stack trace.

 An asynchronous error `error` is matched by a test function if
 `test(error)` returns true. If [test] is omitted, every error is
 considered matching.

 If the error is intercepted, the [onError] function can decide what to do
 with it. It can throw if it wants to raise a new (or the same) error,
 or simply return to make this stream forget the error.
 If the received `error` value is thrown again by the [onError] function,
 it acts like a `rethrow` and it is emitted along with its original
 stack trace, not the stack trace of the `throw` inside [onError].

 If you need to transform an error into a data event, use the more generic
 [Stream.transform] to handle the event by writing a data event to
 the output sink.

 The returned stream is a broadcast stream if this stream is.
 If a broadcast stream is listened to more than once, each subscription
 will individually perform the `test` and handle the error.

 Example:
 ```dart
 Stream.periodic(const Duration(seconds: 1), (count) ).take(4).handleError(print).forEach(print);

 // Outputs:
 // 0
 // 1
 // Exception: Exceptional event
 // 3
 // 4
 ```

## Return Type
`Stream&lt;T&gt;`

## Parameters

- `onError`: `Function`
- ``: `dynamic`
