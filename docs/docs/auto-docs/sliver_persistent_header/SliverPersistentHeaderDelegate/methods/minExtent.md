# Method: `minExtent`

## Description

The smallest size to allow the header to reach, when it shrinks at the
 start of the viewport.

 This must return a value equal to or less than [maxExtent].

 This value should not change over the lifetime of the delegate. It should
 be based entirely on the constructor arguments passed to the delegate. See
 [shouldRebuild], which must return true if a new delegate would return a
 different value.

## Return Type
`double`

