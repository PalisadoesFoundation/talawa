# Method: `updateSync`

## Description

Synchronously updates an existing link.

 Deletes the existing link at [path] and uses [createSync] to create a new
 link to [target]. Throws [PathNotFoundException] if the original link
 does not exist or any [FileSystemException] that [deleteSync] or
 [createSync] can throw.

## Return Type
`void`

## Parameters

- `target`: `String`
