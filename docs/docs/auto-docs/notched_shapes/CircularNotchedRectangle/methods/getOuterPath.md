# Method: `getOuterPath`

## Description

Creates a [Path] that describes a rectangle with a smooth circular notch.

 `host` is the bounding box for the returned shape. Conceptually this is
 the rectangle to which the notch will be applied.

 `guest` is the bounding box of a circle that the notch accommodates. All
 points in the circle bounded by `guest` will be outside of the returned
 path.

 The notch is curve that smoothly connects the host's top edge and
 the guest circle.

## Return Type
`Path`

## Parameters

- `host`: `Rect`
- `guest`: `Rect?`
