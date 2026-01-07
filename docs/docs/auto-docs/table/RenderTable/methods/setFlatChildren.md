# Method: `setFlatChildren`

## Description

Replaces the children of this table with the given cells.

 The cells are divided into the specified number of columns before
 replacing the existing children.

 If the new cells contain any existing children of the table, those
 children are moved to their new location in the table rather than
 removed from the table and re-added.

## Return Type
`void`

## Parameters

- `columns`: `int`
- `cells`: `List<RenderBox?>`
