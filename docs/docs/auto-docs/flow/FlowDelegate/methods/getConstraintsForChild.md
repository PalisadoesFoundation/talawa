# Method: `getConstraintsForChild`

## Description

Override to control the layout constraints given to each child.

 By default, the children will receive the given constraints, which are the
 constraints used to size the container. The children need
 not respect the given constraints, but they are required to respect the
 returned constraints. For example, the incoming constraints might require
 the container to have a width of exactly 100.0 and a height of exactly
 100.0, but this function might give the children looser constraints that
 let them be larger or smaller than 100.0 by 100.0.

 If this function depends on information other than the given constraints,
 override [shouldRelayout] to indicate when the container should
 relayout.

## Return Type
`BoxConstraints`

## Parameters

- `i`: `int`
- `constraints`: `BoxConstraints`
