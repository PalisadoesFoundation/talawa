# Method: `findAnnotations`

## Description

Search this layer and its subtree for annotations of type `S` at the
 location described by `localPosition`.

 This method is called by the default implementation of [find] and
 [findAllAnnotations]. Override this method to customize how the layer
 should search for annotations, or if the layer has its own annotations to
 add.

 The default implementation always returns `false`, which means neither
 the layer nor its children has annotations, and the annotation search
 is not absorbed either (see below for explanation).

 ## About layer annotations

 
 An annotation is an optional object of any type that can be carried with a
 layer. An annotation can be found at a location as long as the owner layer
 contains the location and is walked to.

 The annotations are searched by first visiting each child recursively,
 then this layer, resulting in an order from visually front to back.
 Annotations must meet the given restrictions, such as type and position.

 The common way for a value to be found here is by pushing an
 [AnnotatedRegionLayer] into the layer tree, or by adding the desired
 annotation by overriding [findAnnotations].
 

 ## Parameters and return value

 The [result] parameter is where the method outputs the resulting
 annotations. New annotations found during the walk are added to the tail.

 The [onlyFirst] parameter indicates that, if true, the search will stop
 when it finds the first qualified annotation; otherwise, it will walk the
 entire subtree.

 The return value indicates the opacity of this layer and its subtree at
 this position. If it returns true, then this layer's parent should skip
 the children behind this layer. In other words, it is opaque to this type
 of annotation and has absorbed the search so that its siblings behind it
 are not aware of the search. If the return value is false, then the parent
 might continue with other siblings.

 The return value does not affect whether the parent adds its own
 annotations; in other words, if a layer is supposed to add an annotation,
 it will always add it even if its children are opaque to this type of
 annotation. However, the opacity that the parents return might be affected
 by their children, hence making all of its ancestors opaque to this type
 of annotation.

## Return Type
`bool`

## Parameters

- `result`: `AnnotationResult&lt;S&gt;`
- `localPosition`: `Offset`
- ``: `dynamic`
