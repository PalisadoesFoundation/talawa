# Method: `findAllAnnotations`

## Description

Search this layer and its subtree for all annotations of type `S` under
 the point described by `localPosition`.

 Returns a result with empty entries if no matching annotations are found.

 By default this method calls [findAnnotations] with `onlyFirst:
 false` and returns the annotations of its result. Prefer overriding
 [findAnnotations] instead of this method, because during an annotation
 search, only [findAnnotations] is recursively called, while custom
 behavior in this method is ignored.

 ## About layer annotations

 

 See also:

  * [find], which is similar but returns the first annotation found at the
    given position.
  * [AnnotatedRegionLayer], for placing values in the layer tree.

## Return Type
`AnnotationResult&lt;S&gt;`

## Parameters

- `localPosition`: `Offset`
