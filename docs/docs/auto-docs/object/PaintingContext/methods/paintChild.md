# Method: `paintChild`

## Description

Paint a child [RenderObject].

 If the child has its own composited layer, the child will be composited
 into the layer subtree associated with this painting context. Otherwise,
 the child will be painted into the current PictureLayer for this context.

## Return Type
`void`

## Parameters

- `child`: `RenderObject`
- `offset`: `Offset`
