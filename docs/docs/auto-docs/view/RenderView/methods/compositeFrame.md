# Method: `compositeFrame`

## Description

Uploads the composited layer tree to the engine.

 Actually causes the output of the rendering pipeline to appear on screen.

 Before calling this method, the [owner] must be set by calling [attach],
 the [configuration] must be set to a non-null value, and the
 [prepareInitialFrame] method must have been called.

## Return Type
`void`

