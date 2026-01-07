# Overview for `ShaderMaskLayer`

## Description

A composited layer that applies a shader to its children.

 The shader is only applied inside the given [maskRect]. The shader itself
 uses the top left of the [maskRect] as its origin.

 The [maskRect] does not affect the positions of any child layers.

## Dependencies

- ContainerLayer

## Members

- **_shader**: `Shader?`
- **_maskRect**: `Rect?`
- **_blendMode**: `BlendMode?`
## Constructors

### Unnamed Constructor
Creates a shader mask layer.

 The [shader], [maskRect], and [blendMode] properties must be non-null
 before the compositing phase of the pipeline.

