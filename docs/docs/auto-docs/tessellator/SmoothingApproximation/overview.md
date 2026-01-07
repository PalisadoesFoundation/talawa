# Overview for `SmoothingApproximation`

## Description

Information about how to approximate points on a curved path segment.

 In particular, the values in this object control how many vertices to
 generate when approximating curves, and what tolerances to use when
 calculating the sharpness of curves.

 Used by [VerticesBuilder.tessellate].

## Members

- **scale**: `double`
  The scaling coefficient to use when translating to screen coordinates.

 Values approaching 0.0 will generate smoother looking curves with a
 greater number of vertices, and will be more expensive to calculate.

- **angleTolerance**: `double`
  The tolerance value in radians for calculating sharp angles.

 Values approaching 0.0 will provide more accurate approximation of sharp
 turns. A 0.0 value means angle conditions are not considered at all.

- **cuspLimit**: `double`
  An angle in radians at which to introduce bevel cuts.

 Values greater than zero will restirct the sharpness of bevel cuts on
 turns.

## Constructors

### Unnamed Constructor
Creates a new smoothing approximation instance with default values.

