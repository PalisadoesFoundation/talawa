# Method: `showInViewport`

## Description

Make (a portion of) the given `descendant` of the given `viewport` fully
 visible in the `viewport` by manipulating the provided [ViewportOffset]
 `offset`.

 The optional `rect` parameter describes which area of the `descendant`
 should be shown in the viewport. If `rect` is null, the entire
 `descendant` will be revealed. The `rect` parameter is interpreted
 relative to the coordinate system of `descendant`.

 The returned [Rect] describes the new location of `descendant` or `rect`
 in the viewport after it has been revealed. See [RevealedOffset.rect]
 for a full definition of this [Rect].

 If `descendant` is null, this is a no-op and `rect` is returned.

 If both `descendant` and `rect` are null, null is returned because there is
 nothing to be shown in the viewport.

 The `duration` parameter can be set to a non-zero value to animate the
 target object into the viewport with an animation defined by `curve`.

 See also:

 * [RenderObject.showOnScreen], overridden by [RenderViewportBase] and the
   renderer for [SingleChildScrollView] to delegate to this method.

## Return Type
`Rect?`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
