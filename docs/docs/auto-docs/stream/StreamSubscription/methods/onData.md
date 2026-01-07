# Method: `onData`

## Description

Replaces the data event handler of this subscription.

 The [handleData] function is called for each data event of the stream
 after this function is called.
 If [handleData] is `null`, data events are ignored.

 This method replaces the current handler set by the invocation of
 [Stream.listen] or by a previous call to [onData].

## Return Type
`void`

## Parameters

- ``: `dynamic`
