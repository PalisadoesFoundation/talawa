# Method: `debugResetSize`

## Description

If a subclass has a "size" (the state controlled by `parentUsesSize`,
 whatever it is in the subclass, e.g. the actual `size` property of
 [RenderBox]), and the subclass verifies that in debug mode this "size"
 property isn't used when [debugCanParentUseSize] isn't set, then that
 subclass should override [debugResetSize] to reapply the current values of
 [debugCanParentUseSize] to that state.

## Return Type
`void`

