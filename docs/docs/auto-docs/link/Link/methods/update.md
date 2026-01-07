# Method: `update`

## Description

Updates an existing link.

 Deletes the existing link at [path] and creates a new link to [target],
 using [create].

 Returns a future which completes with this `Link` if successful,
 and with a [PathNotFoundException] if there is no existing link at [path],
 or with any [FileSystemException] that [delete] or [create] can throw.

## Return Type
`Future&lt;Link&gt;`

## Parameters

- `target`: `String`
