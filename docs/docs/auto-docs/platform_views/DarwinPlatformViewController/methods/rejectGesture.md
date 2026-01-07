# Method: `rejectGesture`

## Description

Rejects an active gesture.

 When a touch sequence is happening on the embedded UIView all touch events are delayed.
 Calling this method drops the buffered touch events and prevents any future touch events for
 the pointers that are part of the active touch sequence from arriving to the embedded view.

## Return Type
`Future&lt;void&gt;`

