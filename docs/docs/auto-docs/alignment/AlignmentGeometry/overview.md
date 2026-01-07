# Overview for `AlignmentGeometry`

## Description

Base class for [Alignment] that allows for text-direction aware
 resolution.

 A property or argument of this type accepts classes created either with [
 Alignment] and its variants, or [AlignmentDirectional.new].

 To convert an [AlignmentGeometry] object of indeterminate type into an
 [Alignment] object, call the [resolve] method.

## Constructors

### Unnamed Constructor
Abstract const constructor. This constructor enables subclasses to provide
 const constructors so that they can be used in const expressions.

### xy
Creates an [Alignment].

#### Parameters

- `x`: `double`
- `y`: `double`
### directional
Creates a directional alignment, or [AlignmentDirectional].

#### Parameters

- `start`: `double`
- `y`: `double`
