# Method: `scheduleInitialPaint`

## Description

Bootstrap the rendering pipeline by scheduling the very first paint.

 Requires that this render object is attached, is the root of the render
 tree, and has a composited layer.

 See [RenderView] for an example of how this function is used.

## Return Type
`void`

## Parameters

- `rootLayer`: `ContainerLayer`
