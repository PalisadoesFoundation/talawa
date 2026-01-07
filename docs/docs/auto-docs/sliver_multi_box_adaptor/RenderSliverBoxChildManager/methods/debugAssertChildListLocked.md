# Method: `debugAssertChildListLocked`

## Description

In debug mode, asserts that this manager is not expecting any
 modifications to the [RenderSliverMultiBoxAdaptor]'s child list.

 This function always returns true.

 The manager is not required to track whether it is expecting modifications
 to the [RenderSliverMultiBoxAdaptor]'s child list and can return
 true without making any assertions.

## Return Type
`bool`

