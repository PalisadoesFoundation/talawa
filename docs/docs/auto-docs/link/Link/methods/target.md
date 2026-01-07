# Method: `target`

## Description

Gets the target of the link.

 Returns a future that completes with the path to the target.

 If the returned target is a relative path, it is relative to the
 directory containing the link.

 If the link does not exist, or is not a link, the future completes with
 a [FileSystemException].

## Return Type
`Future&lt;String&gt;`

