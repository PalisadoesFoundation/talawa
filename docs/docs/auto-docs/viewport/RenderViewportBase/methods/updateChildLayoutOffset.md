# Method: `updateChildLayoutOffset`

## Description

Called during [layoutChildSequence] to store the layout offset for the
 given child.

 Different subclasses using different representations for their children's
 layout offset (e.g., logical or physical coordinates). This function lets
 subclasses transform the child's layout offset before storing it in the
 child's parent data.

## Return Type
`void`

## Parameters

- `child`: `RenderSliver`
- `layoutOffset`: `double`
- `growthDirection`: `GrowthDirection`
