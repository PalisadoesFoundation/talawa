# Method: `acceptGesture`

## Description

Accept an active gesture.

 When a touch sequence is happening on the embedded UIView all touch events are delayed.
 Calling this method releases the delayed events to the embedded UIView and makes it consume
 any following touch events for the pointers involved in the active gesture.

## Return Type
`Future&lt;void&gt;`

