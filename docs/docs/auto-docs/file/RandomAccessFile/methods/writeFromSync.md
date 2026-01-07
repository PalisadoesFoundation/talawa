# Method: `writeFromSync`

## Description

Synchronously writes from a [buffer] to the file.

 Will read the buffer from index [start] to index [end].
 The [start] must be non-negative and no greater than [buffer].length.
 If [end] is omitted, it defaults to [buffer].length.
 Otherwise [end] must be no less than [start]
 and no greater than [buffer].length.

 Throws a [FileSystemException] if the operation fails.

## Return Type
`void`

## Parameters

- `buffer`: `List&lt;int&gt;`
- ``: `dynamic`
- ``: `dynamic`
