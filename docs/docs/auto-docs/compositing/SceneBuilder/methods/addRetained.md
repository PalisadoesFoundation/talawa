# Method: `addRetained`

## Description

Add a retained engine layer subtree from previous frames.

 All the engine layers that are in the subtree of the retained layer will
 be automatically appended to the current engine layer tree.

 Therefore, when implementing a subclass of the [Layer] concept defined in
 the rendering layer of Flutter's framework, once this is called, there's
 no need to call [Layer.addToScene] for its children layers.

 

## Return Type
`void`

## Parameters

- `retainedLayer`: `EngineLayer`
