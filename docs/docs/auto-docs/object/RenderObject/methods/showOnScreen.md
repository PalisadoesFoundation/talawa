# Method: `showOnScreen`

## Description

Attempt to make (a portion of) this or a descendant [RenderObject] visible
 on screen.

 If `descendant` is provided, that [RenderObject] is made visible. If
 `descendant` is omitted, this [RenderObject] is made visible.

 The optional `rect` parameter describes which area of that [RenderObject]
 should be shown on screen. If `rect` is null, the entire
 [RenderObject] (as defined by its [paintBounds]) will be revealed. The
 `rect` parameter is interpreted relative to the coordinate system of
 `descendant` if that argument is provided and relative to this
 [RenderObject] otherwise.

 The `duration` parameter can be set to a non-zero value to bring the
 target object on screen in an animation defined by `curve`.

 See also:

 * [RenderViewportBase.showInViewport], which [RenderViewportBase] and
   [SingleChildScrollView] delegate this method to.

## Return Type
`void`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
