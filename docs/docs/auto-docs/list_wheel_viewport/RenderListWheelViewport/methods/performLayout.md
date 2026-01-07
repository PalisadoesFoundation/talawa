# Method: `performLayout`

## Description

Performs layout based on how [childManager] provides children.

 From the current scroll offset, the minimum index and maximum index that
 is visible in the viewport can be calculated. The index range of the
 currently active children can also be acquired by looking directly at
 the current child list. This function has to modify the current index
 range to match the target index range by removing children that are no
 longer visible and creating those that are visible but not yet provided
 by [childManager].

## Return Type
`void`

