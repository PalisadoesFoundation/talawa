# Method: `addLayer`

## Description

Adds a composited leaf layer to the recording.

 After calling this function, the [canvas] property will change to refer to
 a new [Canvas] that draws on top of the given layer.

 A [RenderObject] that uses this function is very likely to require its
 [RenderObject.alwaysNeedsCompositing] property to return true. That informs
 ancestor render objects that this render object will include a composited
 layer, which, for example, causes them to use composited clips.

 See also:

  * [pushLayer], for adding a layer and painting further contents within
    it.

## Return Type
`void`

## Parameters

- `layer`: `Layer`
