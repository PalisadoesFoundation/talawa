# Method: `indexToLayoutOffset`

## Description

The layout offset for the child with the given index.

 This function uses the returned value of [itemExtentBuilder] or the
 [itemExtent] to avoid recomputing item size repeatedly during layout.

 By default, places the children in order, without gaps, starting from
 layout offset zero.

## Return Type
`double`

## Parameters

- `itemExtent`: `double`
- `index`: `int`
