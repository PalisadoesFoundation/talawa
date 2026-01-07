# Method: `maxExtent`

## Description

The size of the header when it is not shrinking at the top of the
 viewport.

 This must return a value equal to or greater than [minExtent].

 This value should not change over the lifetime of the delegate. It should
 be based entirely on the constructor arguments passed to the delegate. See
 [shouldRebuild], which must return true if a new delegate would return a
 different value.

## Return Type
`double`

