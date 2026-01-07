# Method: `hasChild`

## Description

True if a non-null LayoutChild was provided for the specified id.

 Call this from the [performLayout] method to determine which children
 are available, if the child list might vary.

 This method cannot be called from [getSize] as the size is not allowed
 to depend on the children.

## Return Type
`bool`

## Parameters

- `childId`: `Object`
