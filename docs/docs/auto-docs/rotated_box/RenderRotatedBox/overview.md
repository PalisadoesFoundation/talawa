# Overview for `RenderRotatedBox`

## Description

Rotates its child by a integral number of quarter turns.

 Unlike [RenderTransform], which applies a transform just prior to painting,
 this object applies its rotation prior to layout, which means the entire
 rotated box consumes only as much space as required by the rotated child.

## Dependencies

- RenderBox, RenderObjectWithChildMixin

## Members

- **_quarterTurns**: `int`
- **_paintTransform**: `Matrix4?`
- **_transformLayer**: `LayerHandle&lt;TransformLayer&gt;`
## Constructors

### Unnamed Constructor
Creates a rotated render box.

