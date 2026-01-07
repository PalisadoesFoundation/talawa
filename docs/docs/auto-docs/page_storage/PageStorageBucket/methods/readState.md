# Method: `readState`

## Description

Read given data from into this page storage bucket using the specified
 identifier or an identifier computed from the given context.
 The computed identifier is based on the [PageStorageKey]s
 found in the path from context to the [PageStorage] widget that
 owns this page storage bucket.

 If an explicit identifier is not provided and no [PageStorageKey]s
 are found, then null is returned.

## Return Type
`dynamic`

## Parameters

- `context`: `BuildContext`
- ``: `dynamic`
