# Method: `childCount`

## Description

Called to obtain a precise measure of the total number of children.

 Must return the number that is one greater than the greatest `index` for
 which `createChild` will actually create a child.

 This is used when [createChild] cannot add a child for a positive `index`,
 to determine the precise dimensions of the sliver. It must return an
 accurate and precise non-null value. It will not be called if
 [createChild] is always able to create a child (e.g. for an infinite
 list).

## Return Type
`int`

