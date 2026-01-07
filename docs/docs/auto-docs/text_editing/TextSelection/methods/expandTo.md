# Method: `expandTo`

## Description

Returns the smallest [TextSelection] that this could expand to in order to
 include the given [TextPosition].

 If the given [TextPosition] is already inside of the selection, then
 returns `this` without change.

 The returned selection will always be a strict superset of the current
 selection. In other words, the selection grows to include the given
 [TextPosition].

 If extentAtIndex is true, then the [TextSelection.extentOffset] will be
 placed at the given index regardless of the original order of it and
 [TextSelection.baseOffset]. Otherwise, their order will be preserved.

 ## Difference with [extendTo]
 In contrast with this method, [extendTo] is a pivot; it holds
 [TextSelection.baseOffset] fixed while moving [TextSelection.extentOffset]
 to the given [TextPosition]. It doesn't strictly grow the selection and
 may collapse it or flip its order.

## Return Type
`TextSelection`

## Parameters

- `position`: `TextPosition`
- ``: `dynamic`
