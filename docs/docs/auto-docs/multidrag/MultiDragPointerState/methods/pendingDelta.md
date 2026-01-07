# Method: `pendingDelta`

## Description

The offset of the pointer from the last position that was reported to the client.

 After the pointer contacts the screen, the pointer might move some
 distance before this movement will be recognized as a drag. This field
 accumulates that movement so that we can report it to the client after
 the drag starts.

## Return Type
`Offset?`

