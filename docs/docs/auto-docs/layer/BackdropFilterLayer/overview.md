# Overview for `BackdropFilterLayer`

## Description

A composited layer that applies a filter to the existing contents of the scene.

## Dependencies

- ContainerLayer

## Members

- **_filter**: `ui.ImageFilter?`
- **_blendMode**: `BlendMode`
- **_backdropKey**: `BackdropKey?`
## Constructors

### Unnamed Constructor
Creates a backdrop filter layer.

 The [filter] property must be non-null before the compositing phase of the
 pipeline.

 The [blendMode] property defaults to [BlendMode.srcOver].

