# Method: `startConnect`

## Description

Like [connect], but returns a [Future] that completes with a
 [ConnectionTask] that can be cancelled if the [RawSocket] is no
 longer needed.

## Return Type
`Future&lt;ConnectionTask&lt;RawSocket&gt;&gt;`

## Parameters

- `host`: `dynamic`
- `port`: `int`
- ``: `dynamic`
- ``: `dynamic`
