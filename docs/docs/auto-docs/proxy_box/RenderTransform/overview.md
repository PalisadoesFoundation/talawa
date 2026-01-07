# Overview for `RenderTransform`

## Description

Applies a transformation before painting its child.

## Dependencies

- RenderProxyBox

## Members

- **_origin**: `Offset?`
- **_alignment**: `AlignmentGeometry?`
- **_textDirection**: `TextDirection?`
- **transformHitTests**: `bool`
  When set to true, hit tests are performed based on the position of the
 child as it is painted. When set to false, hit tests are performed
 ignoring the transformation.

 [applyPaintTransform], and therefore [localToGlobal] and [globalToLocal],
 always honor the transformation, regardless of the value of this property.

- **_transform**: `Matrix4?`
- **_filterQuality**: `FilterQuality?`
## Constructors

### Unnamed Constructor
Creates a render object that transforms its child.

