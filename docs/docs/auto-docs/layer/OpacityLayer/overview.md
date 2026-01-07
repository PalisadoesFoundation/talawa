# Overview for `OpacityLayer`

## Description

A composited layer that makes its children partially transparent.

 When debugging, setting [debugDisableOpacityLayers] to true will cause this
 layer to be skipped (directly replaced by its children). This can be helpful
 to track down the cause of performance problems.

 Try to avoid an [OpacityLayer] with no children. Remove that layer if
 possible to save some tree walks.

## Dependencies

- OffsetLayer

## Members

- **_alpha**: `int?`
## Constructors

### Unnamed Constructor
Creates an opacity layer.

 The [alpha] property must be non-null before the compositing phase of
 the pipeline.

