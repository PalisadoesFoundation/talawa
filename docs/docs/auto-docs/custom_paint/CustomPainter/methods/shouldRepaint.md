# Method: `shouldRepaint`

## Description

Called whenever a new instance of the custom painter delegate class is
 provided to the [RenderCustomPaint] object, or any time that a new
 [CustomPaint] object is created with a new instance of the custom painter
 delegate class (which amounts to the same thing, because the latter is
 implemented in terms of the former).

 If the new instance represents different information than the old
 instance, then the method should return true, otherwise it should return
 false.

 If the method returns false, then the [paint] call might be optimized
 away.

 It's possible that the [paint] method will get called even if
 [shouldRepaint] returns false (e.g. if an ancestor or descendant needed to
 be repainted). It's also possible that the [paint] method will get called
 without [shouldRepaint] being called at all (e.g. if the box changes
 size).

 If a custom delegate has a particularly expensive paint function such that
 repaints should be avoided as much as possible, a [RepaintBoundary] or
 [RenderRepaintBoundary] (or other render object with
 [RenderObject.isRepaintBoundary] set to true) might be helpful.

 The `oldDelegate` argument will never be null.

## Return Type
`bool`

## Parameters

- `oldDelegate`: `CustomPainter`
