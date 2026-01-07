# Method: `collectGarbage`

## Description

Called after layout with the number of children that can be garbage
 collected at the head and tail of the child list.

 Children whose [SliverMultiBoxAdaptorParentData.keepAlive] property is
 set to true will be removed to a cache instead of being dropped.

 This method also collects any children that were previously kept alive but
 are now no longer necessary. As such, it should be called every time
 [performLayout] is run, even if the arguments are both zero.

 See also:

   * [calculateLeadingGarbage], which can be used to determine
     `leadingGarbage` here.
   * [calculateTrailingGarbage], which can be used to determine
     `trailingGarbage` here.

## Return Type
`void`

## Parameters

- `leadingGarbage`: `int`
- `trailingGarbage`: `int`
