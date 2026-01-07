# Method: `engineLayer`

## Description

Sets the engine layer used to render this layer.

 Typically this field is set to the value returned by [addToScene], which
 in turn returns the engine layer produced by one of [ui.SceneBuilder]'s
 "push" methods, such as [ui.SceneBuilder.pushOpacity].

## Parameters

- `value`: `ui.EngineLayer?`
