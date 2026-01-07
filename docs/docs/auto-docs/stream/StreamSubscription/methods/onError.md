# Method: `onError`

## Description

Replaces the error event handler of this subscription.

 The [handleError] function must be able to be called with either
 one positional argument, or with two positional arguments
 where the seconds is always a [StackTrace].

 The [handleError] argument may be `null`, in which case further
 error events are considered *unhandled*, and will be reported to
 [Zone.handleUncaughtError].

 The provided function is called for all error events from the
 stream subscription.

 This method replaces the current handler set by the invocation of
 [Stream.listen], by calling [asFuture], or by a previous call to [onError].

## Return Type
`void`

## Parameters

- `handleError`: `Function?`
