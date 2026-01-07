# Method: `paintStack`

## Description

Override in subclasses to customize how the stack paints.

 By default, the stack uses [defaultPaint]. This function is called by
 [paint] after potentially applying a clip to contain visual overflow.

## Return Type
`void`

## Parameters

- `context`: `PaintingContext`
- `offset`: `Offset`
