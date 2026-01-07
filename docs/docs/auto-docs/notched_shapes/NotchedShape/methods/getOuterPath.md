# Method: `getOuterPath`

## Description

Creates a [Path] that describes the outline of the shape.

 The `host` is the bounding rectangle of the shape.

 The `guest` is the bounding rectangle of the shape for which a notch will
 be made. It is null when there is no guest.

## Return Type
`Path`

## Parameters

- `host`: `Rect`
- `guest`: `Rect?`
