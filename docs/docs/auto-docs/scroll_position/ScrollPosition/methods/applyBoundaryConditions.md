# Method: `applyBoundaryConditions`

## Description

Returns the overscroll by applying the boundary conditions.

 If the given value is in bounds, returns 0.0. Otherwise, returns the
 amount of value that cannot be applied to [pixels] as a result of the
 boundary conditions. If the [physics] allow out-of-bounds scrolling, this
 method always returns 0.0.

 The default implementation defers to the [physics] object's
 [ScrollPhysics.applyBoundaryConditions].

## Return Type
`double`

## Parameters

- `value`: `double`
