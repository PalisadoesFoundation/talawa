# Method: `writeFromSync`

## Description

Writes from a [buffer] to the socket.

 Will read the buffer from index [start] to index [end].
 The [start] must be non-negative and no greater than [buffer].length.
 If [end] is omitted, it defaults to [buffer].length.
 Otherwise [end] must be no less than [start]
 and no greater than [buffer].length.

## Return Type
`void`

## Parameters

- `buffer`: `List&lt;int&gt;`
- ``: `dynamic`
- ``: `dynamic`
