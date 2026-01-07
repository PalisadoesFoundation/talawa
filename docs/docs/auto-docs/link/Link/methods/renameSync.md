# Method: `renameSync`

## Description

Synchronously renames this link.

 Returns a [Link] instance for the renamed link.

 If [newPath] identifies an existing file or link, that entity is removed
 first. If [newPath] identifies an existing directory then
 [FileSystemException] is thrown.

## Return Type
`Link`

## Parameters

- `newPath`: `String`
