# Overview for `TransformLayer`

## Description

A composited layer that applies a given transformation matrix to its
 children.

 This class inherits from [OffsetLayer] to make it one of the layers that
 can be used at the root of a [RenderObject] hierarchy.

## Dependencies

- OffsetLayer

## Members

- **_transform**: `Matrix4?`
- **_lastEffectiveTransform**: `Matrix4?`
- **_invertedTransform**: `Matrix4?`
- **_inverseDirty**: `bool`
## Constructors

### Unnamed Constructor
Creates a transform layer.

 The [transform] and [offset] properties must be non-null before the
 compositing phase of the pipeline.

