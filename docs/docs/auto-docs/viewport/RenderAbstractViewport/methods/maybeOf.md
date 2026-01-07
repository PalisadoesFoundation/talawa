# Method: `maybeOf`

## Description

Returns the [RenderAbstractViewport] that most tightly encloses the given
 render object.

 If the object does not have a [RenderAbstractViewport] as an ancestor,
 this function returns null.

 See also:

 * [RenderAbstractViewport.of], which is similar to this method, but
   asserts if no [RenderAbstractViewport] ancestor is found.

## Return Type
`RenderAbstractViewport?`

## Parameters

- `object`: `RenderObject?`
