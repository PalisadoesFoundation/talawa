# Method: `asyncMap`

## Description

Creates a new stream with each data event of this stream asynchronously
 mapped to a new event.

 This acts like [map], in that [convert] function is called once per
 data event, but here [convert] may be asynchronous and return a [Future].
 If that happens, this stream waits for that future to complete before
 continuing with further events.

 The returned stream is a broadcast stream if this stream is.

## Return Type
`Stream&lt;E&gt;`

## Parameters

- ``: `dynamic`
