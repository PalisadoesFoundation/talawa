# Method: `jumpTo`

## Description

Jumps the attached sheet from its current size to the given [size], a
 fractional value of the parent container's height.

 If [size] is outside of a the attached sheet's min or max child size,
 [jumpTo] will jump the sheet to the nearest valid size instead.

 Any active sheet animation is canceled. If the sheet's inner scrollable
 is currently animating (e.g. responding to a user fling), that animation is
 canceled as well.

 The sheet will not snap after calling [jumpTo] even if [DraggableScrollableSheet.snap]
 is true. Snapping only occurs after user drags.

## Return Type
`void`

## Parameters

- `size`: `double`
