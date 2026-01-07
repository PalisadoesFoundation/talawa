# Method: `maxScrollObstructionExtentBefore`

## Description

Returns the total scroll obstruction extent of all slivers in the viewport
 before [child].

 This is the extent by which the actual area in which content can scroll
 is reduced. For example, an app bar that is pinned at the top will reduce
 the area in which content can actually scroll by the height of the app bar.

## Return Type
`double`

## Parameters

- `child`: `RenderSliver`
