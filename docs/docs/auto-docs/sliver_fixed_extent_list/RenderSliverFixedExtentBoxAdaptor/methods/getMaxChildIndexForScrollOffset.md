# Method: `getMaxChildIndexForScrollOffset`

## Description

The maximum child index that is visible at the given scroll offset.

 This function uses the returned value of [itemExtentBuilder] or the
 [itemExtent] to avoid recomputing item size repeatedly during layout.

 By default, returns a value consistent with the children being placed in
 order, without gaps, starting from layout offset zero.

## Return Type
`int`

## Parameters

- `scrollOffset`: `double`
- `itemExtent`: `double`
