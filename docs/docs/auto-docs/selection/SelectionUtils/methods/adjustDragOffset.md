# Method: `adjustDragOffset`

## Description

Adjusts the dragging offset based on the target rect.

 This method moves the offsets to be within the target rect in case they are
 outside the rect.

 This is used in the case where a drag happens outside of the rectangle
 of a [Selectable].

 The logic works as the following:
 ![](https://flutter.github.io/assets-for-api-docs/assets/rendering/adjust_drag_offset.png)

 For points inside the rect:
   Their effective locations are unchanged.

 For points in Area 1:
   Move them to top-left of the rect if text direction is ltr, or top-right
   if rtl.

 For points in Area 2:
   Move them to bottom-right of the rect if text direction is ltr, or
   bottom-left if rtl.

## Return Type
`Offset`

## Parameters

- `targetRect`: `Rect`
- `point`: `Offset`
- ``: `dynamic`
