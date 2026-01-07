# Method: `transform`

## Description

The matrix to transform the child by during painting. The provided value
 is copied on assignment.

 There is no getter for [transform], because [Matrix4] is mutable, and
 mutations outside of the control of the render object could not reliably
 be reflected in the rendering.

## Parameters

- `value`: `Matrix4`
