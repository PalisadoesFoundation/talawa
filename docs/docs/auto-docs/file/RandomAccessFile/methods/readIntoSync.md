# Method: `readIntoSync`

## Description

Synchronously reads into an existing [buffer].

 Reads bytes and writes them into the range of [buffer]
 from [start] to [end].
 The [start] must be non-negative and no greater than [buffer].length.
 If [end] is omitted, it defaults to [buffer].length.
 Otherwise [end] must be no less than [start]
 and no greater than [buffer].length.

 Returns the number of bytes read. This maybe be less than `end - start`
 if the file doesn't have that many bytes to read.

 Throws a [FileSystemException] if the operation fails.

## Return Type
`int`

## Parameters

- `buffer`: `List&lt;int&gt;`
- ``: `dynamic`
- ``: `dynamic`
