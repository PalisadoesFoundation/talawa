# Method: `flex`

## Description

The flex factor to apply to the cell if there is any room left
 over when laying out the table. The remaining space is
 distributed to any columns with flex in proportion to their flex
 value (higher values get more space).

 The `cells` argument is an iterable that provides all the cells
 in the table for this column. Walking the cells is by definition
 O(N), so algorithms that do that should be considered expensive.

## Return Type
`double?`

## Parameters

- `cells`: `Iterable&lt;RenderBox&gt;`
