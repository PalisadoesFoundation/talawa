# Overview for `FollowerLayer`

## Description

A composited layer that applies a transformation matrix to its children such
 that they are positioned to match a [LeaderLayer].

 If any of the ancestors of this layer have a degenerate matrix (e.g. scaling
 by zero), then the [FollowerLayer] will not be able to transform its child
 to the coordinate space of the [LeaderLayer].

 A [linkedOffset] property can be provided to further offset the child layer
 from the leader layer, for example if the child is to follow the linked
 layer at a distance rather than directly overlapping it.

## Dependencies

- ContainerLayer

## Members

- **link**: `LayerLink`
  The link to the [LeaderLayer].

 The same object should be provided to a [LeaderLayer] that is earlier in
 the layer tree. When this layer is composited, it will apply a transform
 that moves its children to match the position of the [LeaderLayer].

- **showWhenUnlinked**: `bool?`
  Whether to show the layer's contents when the [link] does not point to a
 [LeaderLayer].

 When the layer is linked, children layers are positioned such that they
 have the same global position as the linked [LeaderLayer].

 When the layer is not linked, then: if [showWhenUnlinked] is true,
 children are positioned as if the [FollowerLayer] was a [ContainerLayer];
 if it is false, then children are hidden.

 The [showWhenUnlinked] property must be non-null before the compositing
 phase of the pipeline.

- **unlinkedOffset**: `Offset?`
  Offset from parent in the parent's coordinate system, used when the layer
 is not linked to a [LeaderLayer].

 The scene must be explicitly recomposited after this property is changed
 (as described at [Layer]).

 The [unlinkedOffset] property must be non-null before the compositing
 phase of the pipeline.

 See also:

  * [linkedOffset], for when the layers are linked.

- **linkedOffset**: `Offset?`
  Offset from the origin of the leader layer to the origin of the child
 layers, used when the layer is linked to a [LeaderLayer].

 The scene must be explicitly recomposited after this property is changed
 (as described at [Layer]).

 The [linkedOffset] property must be non-null before the compositing phase
 of the pipeline.

 See also:

  * [unlinkedOffset], for when the layer is not linked.

- **_lastOffset**: `Offset?`
- **_lastTransform**: `Matrix4?`
- **_invertedTransform**: `Matrix4?`
- **_inverseDirty**: `bool`
## Constructors

### Unnamed Constructor
Creates a follower layer.

 The [unlinkedOffset], [linkedOffset], and [showWhenUnlinked] properties
 must be non-null before the compositing phase of the pipeline.

