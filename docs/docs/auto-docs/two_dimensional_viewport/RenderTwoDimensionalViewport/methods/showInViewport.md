# Method: `showInViewport`

## Description

Make (a portion of) the given `descendant` of the given `viewport` fully
 visible in one or both dimensions of the `viewport` by manipulating the
 [ViewportOffset]s.

 The `axisDirection` determines from which axes the `descendant` will be
 revealed. When the `axisDirection` is null, both axes will be updated to
 reveal the descendant.

 The optional `rect` parameter describes which area of the `descendant`
 should be shown in the viewport. If `rect` is null, the entire
 `descendant` will be revealed. The `rect` parameter is interpreted
 relative to the coordinate system of `descendant`.

 The returned [Rect] describes the new location of `descendant` or `rect`
 in the viewport after it has been revealed. See [RevealedOffset.rect]
 for a full definition of this [Rect].

 The parameter `viewport` is required and cannot be null. If `descendant`
 is null, this is a no-op and `rect` is returned.

 If both `descendant` and `rect` are null, null is returned because there
 is nothing to be shown in the viewport.

 The `duration` parameter can be set to a non-zero value to animate the
 target object into the viewport with an animation defined by `curve`.

 See also:

 * [RenderObject.showOnScreen], overridden by
   [RenderTwoDimensionalViewport] to delegate to this method.

## Return Type
`Rect?`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
