# Method: `positionChild`

## Description

Specify the child's origin relative to this origin.

 Call this from your [performLayout] function to position each
 child. If you do not call this for a child, its position will
 remain unchanged. Children initially have their position set to
 (0,0), i.e. the top left of the [RenderCustomMultiChildLayoutBox].

## Return Type
`void`

## Parameters

- `childId`: `Object`
- `offset`: `Offset`
