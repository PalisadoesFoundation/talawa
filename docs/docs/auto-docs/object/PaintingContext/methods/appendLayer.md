# Method: `appendLayer`

## Description

Adds a layer to the recording requiring that the recording is already
 stopped.

 Do not call this function directly: call [addLayer] or [pushLayer]
 instead. This function is called internally when all layers not
 generated from the [canvas] are added.

 Subclasses that need to customize how layers are added should override
 this method.

## Return Type
`void`

## Parameters

- `layer`: `Layer`
