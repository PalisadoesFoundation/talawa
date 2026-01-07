# Overview for `LeaderLayer`

## Description

A composited layer that can be followed by a [FollowerLayer].

 This layer collapses the accumulated offset into a transform and passes
 [Offset.zero] to its child layers in the [addToScene]/[addChildrenToScene]
 methods, so that [applyTransform] will work reliably.

## Dependencies

- ContainerLayer

## Members

- **_link**: `LayerLink`
- **_offset**: `Offset`
## Constructors

### Unnamed Constructor
Creates a leader layer.

 The [link] property must not have been provided to any other [LeaderLayer]
 layers that are [attached] to the layer tree at the same time.

 The [offset] property must be non-null before the compositing phase of the
 pipeline.

