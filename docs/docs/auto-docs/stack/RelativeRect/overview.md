# Overview for `RelativeRect`

## Description

An immutable 2D, axis-aligned, floating-point rectangle whose coordinates
 are given relative to another rectangle's edges, known as the container.
 Since the dimensions of the rectangle are relative to those of the
 container, this class has no width and height members. To determine the
 width or height of the rectangle, convert it to a [Rect] using []
 (passing the container's own Rect), and then examine that object.

## Members

- **fill**: `RelativeRect`
  A rect that covers the entire container.

- **left**: `double`
  Distance from the left side of the container to the left side of this rectangle.

 May be negative if the left side of the rectangle is outside of the container.

- **top**: `double`
  Distance from the top side of the container to the top side of this rectangle.

 May be negative if the top side of the rectangle is outside of the container.

- **right**: `double`
  Distance from the right side of the container to the right side of this rectangle.

 May be positive if the right side of the rectangle is outside of the container.

- **bottom**: `double`
  Distance from the bottom side of the container to the bottom side of this rectangle.

 May be positive if the bottom side of the rectangle is outside of the container.

## Constructors

### fromLTRB
Creates a RelativeRect with the given values.

#### Parameters

- `left`: `dynamic`
- `top`: `dynamic`
- `right`: `dynamic`
- `bottom`: `dynamic`
### fromSize
Creates a RelativeRect from a Rect and a Size. The Rect (first argument)
 and the RelativeRect (the output) are in the coordinate space of the
 rectangle described by the Size, with 0,0 being at the top left.

#### Parameters

- `rect`: `Rect`
- `container`: `Size`
### fromRect
Creates a RelativeRect from two Rects. The second Rect provides the
 container, the first provides the rectangle, in the same coordinate space,
 that is to be converted to a RelativeRect. The output will be in the
 container's coordinate space.

 For example, if the top left of the rect is at 0,0, and the top left of
 the container is at 100,100, then the top left of the output will be at
 -100,-100.

 If the first rect is actually in the container's coordinate space, then
 use [RelativeRect.fromSize] and pass the container's size as the second
 argument instead.

#### Parameters

- `rect`: `Rect`
- `container`: `Rect`
### fromDirectional
Creates a RelativeRect from horizontal position using `start` and `end`
 rather than `left` and `right`.

 If `textDirection` is [TextDirection.rtl], then the `start` argument is
 used for the [right] property and the `end` argument is used for the
 [left] property. Otherwise, if `textDirection` is [TextDirection.ltr],
 then the `start` argument is used for the [left] property and the `end`
 argument is used for the [right] property.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
