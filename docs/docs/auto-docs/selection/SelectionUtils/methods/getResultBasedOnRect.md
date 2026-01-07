# Method: `getResultBasedOnRect`

## Description

Determines [SelectionResult] purely based on the target rectangle.

 This method returns [SelectionResult.end] if the `point` is inside the
 `targetRect`. Returns [SelectionResult.previous] if the `point` is
 considered to be lower than `targetRect` in screen order. Returns
 [SelectionResult.next] if the point is considered to be higher than
 `targetRect` in screen order.

## Return Type
`SelectionResult`

## Parameters

- `targetRect`: `Rect`
- `point`: `Offset`
