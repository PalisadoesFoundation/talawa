# Method: `setIsComplexHint`

## Description

Hints that the painting in the current layer is complex and would benefit
 from caching.

 If this hint is not set, the compositor will apply its own heuristics to
 decide whether the current layer is complex enough to benefit from
 caching.

 Calling this ensures a [Canvas] is available. Only draw calls on the
 current canvas will be hinted; the hint is not propagated to new canvases
 created after a new layer is added to the painting context (e.g. with
 [addLayer] or [pushLayer]).

## Return Type
`void`

