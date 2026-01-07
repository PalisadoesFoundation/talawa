# Method: `createTemp`

## Description

Creates a temporary directory in this directory.

 Additional random characters are appended to [prefix]
 to produce a unique directory name.
 If [prefix] is missing or null, the empty string is used as [prefix].

 Returns a `Future&lt;Directory&gt;` that completes with the newly
 created temporary directory.

## Return Type
`Future&lt;Directory&gt;`

## Parameters

- ``: `dynamic`
