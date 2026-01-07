# Method: `find`

## Description

Search this layer and its subtree for the first annotation of type `S`
 under the point described by `localPosition`.

 Returns null if no matching annotations are found.

 By default this method calls [findAnnotations] with `onlyFirst:
 true` and returns the annotation of the first result. Prefer overriding
 [findAnnotations] instead of this method, because during an annotation
 search, only [findAnnotations] is recursively called, while custom
 behavior in this method is ignored.

 ## About layer annotations

 

 See also:

  * [findAllAnnotations], which is similar but returns all annotations found
    at the given position.
  * [AnnotatedRegionLayer], for placing values in the layer tree.

## Return Type
`S?`

## Parameters

- `localPosition`: `Offset`
