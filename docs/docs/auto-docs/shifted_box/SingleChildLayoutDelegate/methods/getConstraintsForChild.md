# Method: `getConstraintsForChild`

## Description

The constraints for the child given the incoming constraints.

 During layout, the child is given the layout constraints returned by this
 function. The child is required to pick a size for itself that satisfies
 these constraints.

 Defaults to the given constraints.

## Return Type
`BoxConstraints`

## Parameters

- `constraints`: `BoxConstraints`
