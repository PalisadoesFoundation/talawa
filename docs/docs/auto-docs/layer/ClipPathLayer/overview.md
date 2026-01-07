# Overview for `ClipPathLayer`

## Description

A composite layer that clips its children using a path.

 When debugging, setting [debugDisableClipLayers] to true will cause this
 layer to be skipped (directly replaced by its children). This can be helpful
 to track down the cause of performance problems.

## Dependencies

- ContainerLayer

## Members

- **_clipPath**: `Path?`
- **_clipBehavior**: `Clip`
## Constructors

### Unnamed Constructor
Creates a layer with a path-based clip.

 The [clipPath] and [clipBehavior] properties must be non-null before the
 compositing phase of the pipeline.

