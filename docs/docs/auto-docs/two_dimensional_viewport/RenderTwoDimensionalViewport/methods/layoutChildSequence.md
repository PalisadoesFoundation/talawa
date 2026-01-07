# Method: `layoutChildSequence`

## Description

Primary work horse of [performLayout].

 Subclasses must implement this method to layout the children of the
 viewport. The [TwoDimensionalViewportParentData.layoutOffset] must be set
 during this method in order for the children to be positioned during paint.
 Further, children of the viewport must be laid out with the expectation
 that the parent (this viewport) will use their size.

 ```dart
 child.layout(constraints, parentUsesSize: true);
 ```

 The primary methods used for creating and obtaining children is
 [buildOrObtainChildFor], which takes a [ChildVicinity] that is used by the
 [TwoDimensionalChildDelegate]. If a child is not provided by the delegate
 for the provided vicinity, the method will return null, otherwise, it will
 return the [RenderBox] of the child.

 After [layoutChildSequence] is completed, any remaining children that were
 not obtained will be disposed.

## Return Type
`void`

