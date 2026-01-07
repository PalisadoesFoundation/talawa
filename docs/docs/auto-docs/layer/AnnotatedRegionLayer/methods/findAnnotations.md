# Method: `findAnnotations`

## Description

Searches the subtree for annotations of type `S` at the location
 `localPosition`, then adds the annotation [value] if applicable.

 This method always searches its children, and if any child returns `true`,
 the remaining children are skipped. Regardless of what the children
 return, this method then adds this layer's annotation if all of the
 following restrictions are met:

 

 This search process respects `onlyFirst`, meaning that when `onlyFirst` is
 true, the search will stop when it finds the first annotation from the
 children, and the layer's own annotation is checked only when none is
 given by the children.

 The return value is true if any child returns `true`, or if [opaque] is
 true and the layer's annotation is added.

 For explanation of layer annotations, parameters and return value, refer
 to [Layer.findAnnotations].

## Return Type
`bool`

## Parameters

- `result`: `AnnotationResult&lt;S&gt;`
- `localPosition`: `Offset`
- ``: `dynamic`
