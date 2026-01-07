# Overview for `OffsetBase`

## Description

Base class for [Size] and [Offset], which are both ways to describe
 a distance as a two-dimensional axis-aligned vector.

## Members

- **_dx**: `double`
- **_dy**: `double`
## Constructors

### Unnamed Constructor
Abstract const constructor. This constructor enables subclasses to provide
 const constructors so that they can be used in const expressions.

 The first argument sets the horizontal component, and the second the
 vertical component.

