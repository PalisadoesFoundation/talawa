# Overview for `PaintingContext`

## Description

A place to paint.

 Rather than holding a canvas directly, [RenderObject]s paint using a painting
 context. The painting context has a [Canvas], which receives the
 individual draw operations, and also has functions for painting child
 render objects.

 When painting a child render object, the canvas held by the painting context
 can change because the draw operations issued before and after painting the
 child might be recorded in separate compositing layers. For this reason, do
 not hold a reference to the canvas across operations that might paint
 child render objects.

 New [PaintingContext] objects are created automatically when using
 [PaintingContext.repaintCompositedChild] and [pushLayer].

## Dependencies

- ClipContext

## Members

- **_containerLayer**: `ContainerLayer`
- **estimatedBounds**: `Rect`
  An estimate of the bounds within which the painting context's [canvas]
 will record painting commands. This can be useful for debugging.

 The canvas will allow painting outside these bounds.

 The [estimatedBounds] rectangle is in the [canvas] coordinate system.

- **_currentLayer**: `PictureLayer?`
- **_recorder**: `ui.PictureRecorder?`
- **_canvas**: `Canvas?`
## Constructors

### Unnamed Constructor
Creates a painting context.

 Typically only called by [PaintingContext.repaintCompositedChild]
 and [pushLayer].

