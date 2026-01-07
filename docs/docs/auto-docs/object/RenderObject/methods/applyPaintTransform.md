# Method: `applyPaintTransform`

## Description

Applies the transform that would be applied when painting the given child
 to the given matrix.

 Used by coordinate conversion functions ([getTransformTo], for example) to
 translate coordinates local to one render object into coordinates local to
 another render object.

 Some RenderObjects will provide a zeroed out matrix in this method,
 indicating that the child should not paint anything or respond to hit
 tests currently. A parent may supply a non-zero matrix even though it
 does not paint its child currently, for example if the parent is a
 [RenderOffstage] with `offstage` set to true. In both of these cases,
 the parent must return `false` from [paintsChild].

## Return Type
`void`

## Parameters

- `child`: `RenderObject`
- `transform`: `Matrix4`
