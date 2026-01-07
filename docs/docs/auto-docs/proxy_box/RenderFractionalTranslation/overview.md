# Overview for `RenderFractionalTranslation`

## Description

Applies a translation transformation before painting its child.

 The translation is expressed as an [Offset] scaled to the child's size. For
 example, an [Offset] with a `dx` of 0.25 will result in a horizontal
 translation of one quarter the width of the child.

 Hit tests will only be detected inside the bounds of the
 [RenderFractionalTranslation], even if the contents are offset such that
 they overflow.

## Dependencies

- RenderProxyBox

## Members

- **_translation**: `Offset`
- **transformHitTests**: `bool`
  When set to true, hit tests are performed based on the position of the
 child as it is painted. When set to false, hit tests are performed
 ignoring the transformation.

 , and therefore  and ,
 always honor the transformation, regardless of the value of this property.

## Constructors

### Unnamed Constructor
Creates a render object that translates its child's painting.

