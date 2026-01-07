# Overview for `BorderRadiusGeometry`

## Description

Base class for [BorderRadius] that allows for text-direction aware resolution.

 A property or argument of this type accepts classes created either with [
 BorderRadius.only] and its variants, or [BorderRadiusDirectional.only]
 and its variants.

 To convert a [BorderRadiusGeometry] object of indeterminate type into a
 [BorderRadius] object, call the [resolve] method.

## Members

- **zero**: `BorderRadiusGeometry`
  A [BorderRadius] with all zero radii.

## Constructors

### Unnamed Constructor
Abstract const constructor. This constructor enables subclasses to provide
 const constructors so that they can be used in const expressions.

### all
Creates a [BorderRadius] where all radii are `radius`.

#### Parameters

- `radius`: `Radius`
### circular
Creates a [BorderRadius] where all radii are [Radius.circular(radius)].

#### Parameters

- `radius`: `double`
### horizontal
Creates a horizontally symmetrical border radius.

 Utilizing the `left` and `right` properties will return a [BorderRadius],
 while `start` and `end` will yield a [BorderRadiusDirectional]. These
 properties cannot be used interchangeably.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### only
Creates a [BorderRadius] with only the given non-zero values.

 The other corners will be right angles.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### directional
Creates a [BorderRadiusDirectional] with only the given non-zero values.

 The other corners will be right angles.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### vertical
Creates a vertically symmetric [BorderRadius] where the top and bottom
 sides of the rectangle have the same radii.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
