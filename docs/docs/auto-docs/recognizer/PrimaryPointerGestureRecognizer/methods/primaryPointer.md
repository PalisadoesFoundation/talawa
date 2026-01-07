# Method: `primaryPointer`

## Description

The ID of the primary pointer this recognizer is tracking.

 If this recognizer is no longer tracking any pointers, this field holds
 the ID of the primary pointer this recognizer was most recently tracking.
 This enables the recognizer to know which pointer it was most recently
 tracking when [acceptGesture] or [rejectGesture] is called (which may be
 called after the recognizer is no longer tracking a pointer if, e.g.
 [GestureArenaManager.hold] has been called, or if there are other
 recognizers keeping the arena open).

## Return Type
`int?`

