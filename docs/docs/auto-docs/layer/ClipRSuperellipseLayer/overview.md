# Overview for `ClipRSuperellipseLayer`

## Description

A composite layer that clips its children using a rounded superellipse.

 When debugging, setting [debugDisableClipLayers] to true will cause this
 layer to be skipped (directly replaced by its children). This can be helpful
 to track down the cause of performance problems.

 Hit tests are performed based on the bounding box of the rounded
 superellipse.

## Dependencies

- ContainerLayer

## Members

- **_clipRSuperellipse**: `RSuperellipse?`
- **_clipBehavior**: `Clip`
## Constructors

### Unnamed Constructor
Creates a layer with a rounded-rectangular clip.

 The [clipRSuperellipse] and [clipBehavior] properties must be non-null before the
 compositing phase of the pipeline.

