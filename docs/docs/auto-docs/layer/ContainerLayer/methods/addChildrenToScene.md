# Method: `addChildrenToScene`

## Description

Uploads all of this layer's children to the engine.

 This method is typically used by [addToScene] to insert the children into
 the scene. Subclasses of [ContainerLayer] typically override [addToScene]
 to apply effects to the scene using the [ui.SceneBuilder] API, then insert
 their children using [addChildrenToScene], then reverse the aforementioned
 effects before returning from [addToScene].

## Return Type
`void`

## Parameters

- `builder`: `ui.SceneBuilder`
