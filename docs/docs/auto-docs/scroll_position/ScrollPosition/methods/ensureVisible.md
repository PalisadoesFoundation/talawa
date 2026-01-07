# Method: `ensureVisible`

## Description

Animates the position such that the given object is as visible as possible
 by just scrolling this position.

 The optional `targetRenderObject` parameter is used to determine which area
 of that object should be as visible as possible. If `targetRenderObject`
 is null, the entire [RenderObject] (as defined by its
 [RenderObject.paintBounds]) will be as visible as possible. If
 `targetRenderObject` is provided, it must be a descendant of the object.

 See also:

  * [ScrollPositionAlignmentPolicy] for the way in which `alignment` is
    applied, and the way the given `object` is aligned.

## Return Type
`Future&lt;void&gt;`

## Parameters

- `object`: `RenderObject`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
