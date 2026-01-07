# Method: `maxIntrinsicWidth`

## Description

The ideal width that the column should have. This must be equal
 to or greater than the [minIntrinsicWidth]. The column might be
 bigger than this width, e.g. if the column is flexible or if the
 table's width ends up being forced to be bigger than the sum of
 all the maxIntrinsicWidth values.

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
