# Method: `minIntrinsicWidth`

## Description

The smallest width that the column can have.

 The `cells` argument is an iterable that provides all the cells
 in the table for this column. Walking the cells is by definition
 O(N), so algorithms that do that should be considered expensive.

 The `containerWidth` argument is the `maxWidth` of the incoming
 constraints for the table, and might be infinite.

## Return Type
`double`

## Parameters

- `cells`: `Iterable&lt;RenderBox&gt;`
- `containerWidth`: `double`
