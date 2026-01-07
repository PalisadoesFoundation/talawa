# Method: `flushPaint`

## Description

Update the display lists for all render objects.

 This function is one of the core stages of the rendering pipeline.
 Painting occurs after layout and before the scene is recomposited so that
 scene is composited with up-to-date display lists for every render object.

 See [RendererBinding] for an example of how this function is used.

## Return Type
`void`

