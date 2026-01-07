# Overview for `FractionalOffset`

## Description

An offset that's expressed as a fraction of a [Size].

 `FractionalOffset(1.0, 0.0)` represents the top right of the [Size].

 `FractionalOffset(0.0, 1.0)` represents the bottom left of the [Size].

 `FractionalOffset(0.5, 2.0)` represents a point half way across the [Size],
 below the bottom of the rectangle by the height of the [Size].

 The [FractionalOffset] class specifies offsets in terms of a distance from
 the top left, regardless of the [TextDirection].

 ## Design discussion

 [FractionalOffset] and [Alignment] are two different representations of the
 same information: the location within a rectangle relative to the size of
 the rectangle. The difference between the two classes is in the coordinate
 system they use to represent the location.

 [FractionalOffset] uses a coordinate system with an origin in the top-left
 corner of the rectangle whereas [Alignment] uses a coordinate system with an
 origin in the center of the rectangle.

 Historically, [FractionalOffset] predates [Alignment]. When we attempted to
 make a version of [FractionalOffset] that adapted to the [TextDirection], we
 ran into difficulty because placing the origin in the top-left corner
 introduced a left-to-right bias that was hard to remove.

 By placing the origin in the center, [Alignment] and [AlignmentDirectional]
 are able to use the same origin, which means we can use a linear function to
 resolve an [AlignmentDirectional] into an [Alignment] in both
 [TextDirection.rtl] and [TextDirection.ltr].

 [Alignment] is better for most purposes than [FractionalOffset] and should
 be used instead of [FractionalOffset]. We continue to implement
 [FractionalOffset] to support code that predates [Alignment].

 See also:

  * [Alignment], which uses a coordinate system based on the center of the
    rectangle instead of the top left corner of the rectangle.

## Dependencies

- Alignment

## Members

- **topLeft**: `FractionalOffset`
  The top left corner.

- **topCenter**: `FractionalOffset`
  The center point along the top edge.

- **topRight**: `FractionalOffset`
  The top right corner.

- **centerLeft**: `FractionalOffset`
  The center point along the left edge.

- **center**: `FractionalOffset`
  The center point, both horizontally and vertically.

- **centerRight**: `FractionalOffset`
  The center point along the right edge.

- **bottomLeft**: `FractionalOffset`
  The bottom left corner.

- **bottomCenter**: `FractionalOffset`
  The center point along the bottom edge.

- **bottomRight**: `FractionalOffset`
  The bottom right corner.

## Constructors

### Unnamed Constructor
Creates a fractional offset.

### fromOffsetAndSize
Creates a fractional offset from a specific offset and size.

 The returned [FractionalOffset] describes the position of the
 [Offset] in the [Size], as a fraction of the [Size].

#### Parameters

- `offset`: `Offset`
- `size`: `Size`
### fromOffsetAndRect
Creates a fractional offset from a specific offset and rectangle.

 The offset is assumed to be relative to the same origin as the rectangle.

 If the offset is relative to the top left of the rectangle, use [
 FractionalOffset.fromOffsetAndSize] instead, passing `rect.size`.

 The returned [FractionalOffset] describes the position of the
 [Offset] in the [Rect], as a fraction of the [Rect].

#### Parameters

- `offset`: `Offset`
- `rect`: `Rect`
