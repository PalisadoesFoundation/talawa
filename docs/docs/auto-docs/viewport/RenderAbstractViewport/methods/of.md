# Method: `of`

## Description

Returns the [RenderAbstractViewport] that most tightly encloses the given
 render object.

 If the object does not have a [RenderAbstractViewport] as an ancestor,
 this function will assert in debug mode, and throw an exception in release
 mode.

 See also:

 * [RenderAbstractViewport.maybeOf], which is similar to this method, but
   returns null if no [RenderAbstractViewport] ancestor is found.

## Return Type
`RenderAbstractViewport`

## Parameters

- `object`: `RenderObject?`
