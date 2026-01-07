# Method: `addCompositionCallback`

## Description

Adds a callback for when the layer tree that this layer is part of gets
 composited, or when it is detached and will not be rendered again.

 This callback will fire even if an ancestor layer is added with retained
 rendering, meaning that it will fire even if this layer gets added to the
 scene via some call to [ui.SceneBuilder.addRetained] on one of its
 ancestor layers.

 The callback receives a reference to this layer. The recipient must not
 mutate the layer during the scope of the callback, but may traverse the
 tree to find information about the current transform or clip. The layer
 may not be [attached] anymore in this state, but even if it is detached it
 may still have an also detached parent it can visit.

 If new callbacks are added or removed within the [callback], the new
 callbacks will fire (or stop firing) on the _next_ compositing event.

 
 Composition callbacks are useful in place of pushing a layer that would
 otherwise try to observe the layer tree without actually affecting
 compositing. For example, a composition callback may be used to observe
 the total transform and clip of the current container layer to determine
 whether a render object drawn into it is visible or not.

 Calling the returned callback will remove [callback] from the composition
 callbacks.
 

## Return Type
`VoidCallback`

## Parameters

- `callback`: `CompositionCallback`
