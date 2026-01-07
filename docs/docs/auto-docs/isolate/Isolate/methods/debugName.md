# Method: `debugName`

## Description

The name of the [Isolate] displayed for debug purposes.

 This can be set using the `debugName` parameter in [spawn] and [spawnUri].

 This name does not uniquely identify an isolate. Multiple isolates in the
 same process may have the same `debugName`.

 For a given isolate, this value will be the same as the values returned by
 `Dart_DebugName` in the C embedding API and the `debugName` property in
 [IsolateMirror].

## Return Type
`String?`

