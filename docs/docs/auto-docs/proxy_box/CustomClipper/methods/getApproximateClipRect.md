# Method: `getApproximateClipRect`

## Description

Returns an approximation of the clip returned by [getClip], as
 an axis-aligned Rect. This is used by the semantics layer to
 determine whether widgets should be excluded.

 By default, this returns a rectangle that is the same size as
 the RenderObject. If getClip returns a shape that is roughly the
 same size as the RenderObject (e.g. it's a rounded rectangle
 with very small arcs in the corners), then this may be adequate.

## Return Type
`Rect`

## Parameters

- `size`: `Size`
