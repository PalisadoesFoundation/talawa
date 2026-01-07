# Method: `shouldRelayout`

## Description

Called whenever a new instance of the custom layout delegate class is
 provided to the [RenderCustomSingleChildLayoutBox] object, or any time
 that a new [CustomSingleChildLayout] object is created with a new instance
 of the custom layout delegate class (which amounts to the same thing,
 because the latter is implemented in terms of the former).

 If the new instance represents different information than the old
 instance, then the method should return true, otherwise it should return
 false.

 If the method returns false, then the [getSize],
 [getConstraintsForChild], and [getPositionForChild] calls might be
 optimized away.

 It's possible that the layout methods will get called even if
 [shouldRelayout] returns false (e.g. if an ancestor changed its layout).
 It's also possible that the layout method will get called
 without [shouldRelayout] being called at all (e.g. if the parent changes
 size).

## Return Type
`bool`

## Parameters

- `oldDelegate`: `SingleChildLayoutDelegate`
