# Method: `getSize`

## Description

Override to control the size of the container for the children.

 By default, the flow will be as large as possible. If this function
 returns a size that does not respect the given constraints, the size will
 be adjusted to be as close to the returned size as possible while still
 respecting the constraints.

 If this function depends on information other than the given constraints,
 override [shouldRelayout] to indicate when the container should
 relayout.

## Return Type
`Size`

## Parameters

- `constraints`: `BoxConstraints`
