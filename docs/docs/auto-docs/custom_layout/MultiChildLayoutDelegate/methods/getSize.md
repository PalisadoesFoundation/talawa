# Method: `getSize`

## Description

Override this method to return the size of this object given the
 incoming constraints.

 The size cannot reflect the sizes of the children. If this layout has a
 fixed width or height the returned size can reflect that; the size will be
 constrained to the given constraints.

 By default, attempts to size the box to the biggest size
 possible given the constraints.

## Return Type
`Size`

## Parameters

- `constraints`: `BoxConstraints`
