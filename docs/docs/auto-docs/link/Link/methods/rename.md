# Method: `rename`

## Description

Renames this link.

 Returns a `Future&lt;Link&gt;` that completes with a [Link]
 for the renamed link.

 If [newPath] identifies an existing file or link, that entity is removed
 first. If [newPath] identifies an existing directory then the future
 completes with a [FileSystemException].

## Return Type
`Future&lt;Link&gt;`

## Parameters

- `newPath`: `String`
