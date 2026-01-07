# Overview for `AnnotatedRegion`

## Description

Annotates a region of the layer tree with a value.

 See also:

  * [Layer.find], for an example of how this value is retrieved.
  * [AnnotatedRegionLayer], the layer pushed into the layer tree.

## Dependencies

- SingleChildRenderObjectWidget

## Members

- **value**: `T`
  A value which can be retrieved using [Layer.find].

- **sized**: `bool`
  If false, the layer pushed into the tree will not be provided with a size.

 An [AnnotatedRegionLayer] with a size checks that the offset provided in
 [Layer.find] is within the bounds, returning null otherwise.

 See also:

  * [AnnotatedRegionLayer], for a description of this behavior.

## Constructors

### Unnamed Constructor
Creates a new annotated region to insert [value] into the layer tree.

 Neither [child] nor [value] may be null.

 [sized] defaults to true and controls whether the annotated region will
 clip its child.

