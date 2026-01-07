# Method: `writeState`

## Description

Write the given data into this page storage bucket using the
 specified identifier or an identifier computed from the given context.
 The computed identifier is based on the [PageStorageKey]s
 found in the path from context to the [PageStorage] widget that
 owns this page storage bucket.

 If an explicit identifier is not provided and no [PageStorageKey]s
 are found, then the `data` is not saved.

## Return Type
`void`

## Parameters

- `context`: `BuildContext`
- `data`: `dynamic`
- ``: `dynamic`
