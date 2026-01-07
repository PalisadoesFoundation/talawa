# Method: `childCount`

## Description

The maximum number of children that can be provided to
 [RenderListWheelViewport].

 If non-null, the children will have index in the range
 `[0, childCount - 1]`.

 If null, then there's no explicit limits to the range of the children
 except that it has to be contiguous. If [childExistsAt] for a certain
 index returns false, that index is already past the limit.

## Return Type
`int?`

