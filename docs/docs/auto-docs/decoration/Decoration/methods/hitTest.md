# Method: `hitTest`

## Description

Tests whether the given point, on a rectangle of a given size,
 would be considered to hit the decoration or not. For example,
 if the decoration only draws a circle, this function might
 return true if the point was inside the circle and false
 otherwise.

 The decoration may be sensitive to the [TextDirection]. The
 `textDirection` argument should therefore be provided. If it is known that
 the decoration is not affected by the text direction, then the argument
 may be omitted or set to null.

 When a [Decoration] is painted in a [Container] or [DecoratedBox] (which
 is what [Container] uses), the `textDirection` parameter will be populated
 based on the ambient [Directionality] (by way of the [RenderDecoratedBox]
 renderer).

## Return Type
`bool`

## Parameters

- `size`: `Size`
- `position`: `Offset`
- ``: `dynamic`
