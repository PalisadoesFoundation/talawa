# Method: `applyTransform`

## Description

Applies the transform that would be applied when compositing the given
 child to the given matrix.

 Specifically, this should apply the transform that is applied to child's
 _origin_. When using [applyTransform] with a chain of layers, results will
 be unreliable unless the deepest layer in the chain collapses the
 `layerOffset` in [addToScene] to zero, meaning that it passes
 [Offset.zero] to its children, and bakes any incoming `layerOffset` into
 the [ui.SceneBuilder] as (for instance) a transform (which is then also
 included in the transformation applied by [applyTransform]).

 For example, if [addToScene] applies the `layerOffset` and then
 passes [Offset.zero] to the children, then it should be included in the
 transform applied here, whereas if [addToScene] just passes the
 `layerOffset` to the child, then it should not be included in the
 transform applied here.

 This method is only valid immediately after [addToScene] has been called,
 before any of the properties have been changed.

 The default implementation does nothing, since [ContainerLayer], by
 default, composites its children at the origin of the [ContainerLayer]
 itself.

 The `child` argument should generally not be null, since in principle a
 layer could transform each child independently. However, certain layers
 may explicitly allow null as a value, for example if they know that they
 transform all their children identically.

 Used by [FollowerLayer] to transform its child to a [LeaderLayer]'s
 position.

## Return Type
`void`

## Parameters

- `child`: `Layer?`
- `transform`: `Matrix4`
