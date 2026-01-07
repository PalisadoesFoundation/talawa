# Overview for `AnnotatedRegionLayer`

## Description

A composited layer which annotates its children with a value. Pushing this
 layer to the tree is the common way of adding an annotation.

 An annotation is an optional object of any type that, when attached with a
 layer, can be retrieved using [Layer.find] or [Layer.findAllAnnotations]
 with a position. The search process is done recursively, controlled by a
 concept of being opaque to a type of annotation, explained in the document
 of [Layer.findAnnotations].

 When an annotation search arrives, this layer defers the same search to each
 of this layer's children, respecting their opacity. Then it adds this
 layer's annotation if all of the following restrictions are met:

 
 * The target type must be identical to the annotated type `T`.
 * If [size] is provided, the target position must be contained within the
   rectangle formed by [size] and [offset].
 

 This layer is opaque to a type of annotation if any child is also opaque, or
 if [opaque] is true and the layer's annotation is added.

## Dependencies

- ContainerLayer

## Members

- **value**: `T`
  The annotated object, which is added to the result if all restrictions are
 met.

- **size**: `Size?`
  The size of the annotated object.

 If [size] is provided, then the annotation is found only if the target
 position is contained by the rectangle formed by [size] and [offset].
 Otherwise no such restriction is applied, and clipping can only be done by
 the ancestor layers.

- **offset**: `Offset`
  The position of the annotated object.

 The [offset] defaults to [Offset.zero] if not provided, and is ignored if
 [size] is not set.

 The [offset] only offsets the clipping rectangle, and does not affect
 how the painting or annotation search is propagated to its children.

- **opaque**: `bool`
  Whether the annotation of this layer should be opaque during an annotation
 search of type `T`, preventing siblings visually behind it from being
 searched.

 If [opaque] is true, and this layer does add its annotation [value],
 then the layer will always be opaque during the search.

 If [opaque] is false, or if this layer does not add its annotation,
 then the opacity of this layer will be the one returned by the children,
 meaning that it will be opaque if any child is opaque.

 The [opaque] defaults to false.

 The [opaque] is effectively useless during [Layer.find] (more
 specifically, [Layer.findAnnotations] with `onlyFirst: true`), since the
 search process then skips the remaining tree after finding the first
 annotation.

 See also:

  * [Layer.findAnnotations], which explains the concept of being opaque
    to a type of annotation as the return value.
  * [HitTestBehavior], which controls similar logic when hit-testing in the
    render tree.

## Constructors

### Unnamed Constructor
Creates a new layer that annotates its children with [value].

