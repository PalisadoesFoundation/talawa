# Method: `create`

## Description

Creates the directory if it doesn't exist.

 If [recursive] is false, only the last directory in the path is
 created. If [recursive] is true, all non-existing path components
 are created. If the directory already exists nothing is done.

 Returns a `Future&lt;Directory&gt;` that completes with this
 directory once it has been created. If the directory cannot be
 created the future completes with an exception.

## Return Type
`Future&lt;Directory&gt;`

## Parameters

- ``: `dynamic`
