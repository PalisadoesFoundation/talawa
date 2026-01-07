# Method: `handleDeviceCursorUpdate`

## Description

Handles the changes that cause a pointer device to have a new list of mouse
 cursor candidates.

 This change can be caused by a pointer event, in which case
 `triggeringEvent` should not be null, or by other changes, such as when a
 widget has moved under a still mouse, which is detected after the current
 frame is complete. In either case, `cursorCandidates` should be the list of
 cursors at the location of the mouse in hit-test order.

## Return Type
`void`

## Parameters

- `device`: `int`
- `triggeringEvent`: `PointerEvent?`
- `cursorCandidates`: `Iterable&lt;MouseCursor&gt;`
