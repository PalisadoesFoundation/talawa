# Overview for `ClipRectLayer`

## Description

A composite layer that clips its children using a rectangle.

 When debugging, setting [debugDisableClipLayers] to true will cause this
 layer to be skipped (directly replaced by its children). This can be helpful
 to track down the cause of performance problems.

## Dependencies

- ContainerLayer

## Members

- **_clipRect**: `Rect?`
- **_clipBehavior**: `Clip`
## Constructors

### Unnamed Constructor
Creates a layer with a rectangular clip.

 The [clipRect] argument must not be null before the compositing phase of
 the pipeline.

 The [clipBehavior] argument must not be [Clip.none].

