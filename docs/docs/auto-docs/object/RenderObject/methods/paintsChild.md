# Method: `paintsChild`

## Description

Whether the given child would be painted if [paint] were called.

 Some RenderObjects skip painting their children if they are configured to
 not produce any visible effects. For example, a [RenderOffstage] with
 its `offstage` property set to true, or a [RenderOpacity] with its opacity
 value set to zero.

 In these cases, the parent may still supply a non-zero matrix in
 [applyPaintTransform] to inform callers about where it would paint the
 child if the child were painted at all. Alternatively, the parent may
 supply a zeroed out matrix if it would not otherwise be able to determine
 a valid matrix for the child and thus cannot meaningfully determine where
 the child would paint.

## Return Type
`bool`

## Parameters

- `child`: `RenderObject`
