# Method: `pushTransform`

## Description

Pushes a transform operation onto the operation stack.

 The objects are transformed by the given matrix before rasterization.

 
 If `oldLayer` is not null the engine will attempt to reuse the resources
 allocated for the old layer when rendering the new layer. This is purely
 an optimization. It has no effect on the correctness of rendering.
 

 
 Passing a layer to [addRetained] or as `oldLayer` argument to a push
 method counts as _usage_. A layer can be used no more than once in a scene.
 For example, it may not be passed simultaneously to two push methods, or
 to a push method and to `addRetained`.

 When a layer is passed to [addRetained] all descendant layers are also
 considered as used in this scene. The same single-usage restriction
 applies to descendants.

 When a layer is passed as an `oldLayer` argument to a push method, it may
 no longer be used in subsequent frames. If you would like to continue
 reusing the resources associated with the layer, store the layer object
 returned by the push method and use that in the next frame instead of the
 original object.
 

 See [pop] for details about the operation stack.

## Return Type
`TransformEngineLayer`

## Parameters

- `matrix4`: `Float64List`
- ``: `dynamic`
