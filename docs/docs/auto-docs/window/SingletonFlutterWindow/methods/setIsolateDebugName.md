# Method: `setIsolateDebugName`

## Description

Set the debug name associated with this platform dispatcher's root
 isolate.

 

 Normally debug names are automatically generated from the Dart port, entry
 point, and source file. For example: `main.dart$main-1234`.

 This can be combined with flutter tools `--isolate-filter` flag to debug
 specific root isolates. For example: `flutter attach --isolate-filter=[name]`.
 Note that this does not rename any child isolates of the root.

## Return Type
`void`

## Parameters

- `name`: `String`
