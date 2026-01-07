# Method: `onDone`

## Description

Replaces the done event handler of this subscription.

 The [handleDone] function is called when the stream closes.
 The value may be `null`, in which case no function is called.

 This method replaces the current handler set by the invocation of
 [Stream.listen], by calling [asFuture], or by a previous call to [onDone].

## Return Type
`void`

## Parameters

- ``: `dynamic`
