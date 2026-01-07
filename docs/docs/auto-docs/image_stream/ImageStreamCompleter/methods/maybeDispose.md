# Method: `maybeDispose`

## Description

Disposes this [ImageStreamCompleter] unless:
   1. It has never had a listener
   2. It is already disposed
   3. It has listeners.
   4. It has active "keep alive" handles.

## Return Type
`void`

