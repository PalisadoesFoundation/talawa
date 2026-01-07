# Method: `setWillChangeHint`

## Description

Hints that the painting in the current layer is likely to change next frame.

 This hint tells the compositor not to cache the current layer because the
 cache will not be used in the future. If this hint is not set, the
 compositor will apply its own heuristics to decide whether the current
 layer is likely to be reused in the future.

 Calling this ensures a [Canvas] is available. Only draw calls on the
 current canvas will be hinted; the hint is not propagated to new canvases
 created after a new layer is added to the painting context (e.g. with
 [addLayer] or [pushLayer]).

## Return Type
`void`

