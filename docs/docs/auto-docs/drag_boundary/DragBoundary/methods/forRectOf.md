# Method: `forRectOf`

## Description


 Retrieve the [DragBoundary] from the nearest ancestor to
 get its [DragBoundaryDelegate] of [Rect].

 The [useGlobalPosition] specifies whether to retrieve the [DragBoundaryDelegate] of type
 [Rect] in global coordinates. If false, the local coordinates of the boundary are used. Defaults to true.
 

 If no [DragBoundary] ancestor is found, the delegate will return a delegate that allows the drag object to move freely.

## Return Type
`DragBoundaryDelegate&lt;Rect&gt;`

## Parameters

- `context`: `BuildContext`
- ``: `dynamic`
