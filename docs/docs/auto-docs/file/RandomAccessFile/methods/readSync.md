# Method: `readSync`

## Description

Synchronously reads up to [count] bytes from a file

 May return fewer than [count] bytes. This can happen, for example, when
 reading past the end of a file or when reading from a pipe that does not
 currently contain additional data.

 An empty [Uint8List] will only be returned when reading past the end of
 the file or when [count] is `0`.

 Throws a [FileSystemException] if the operation fails.

## Return Type
`Uint8List`

## Parameters

- `count`: `int`
