# Method: `estimatedChildCount`

## Description

The best available estimate of [childCount], or null if no estimate is available.

 This differs from [childCount] in that [childCount] never returns null (and must
 not be accessed if the child count is not yet available, meaning the [createChild]
 method has not been provided an index that does not create a child).

 See also:

  * [SliverChildDelegate.estimatedChildCount], to which this getter defers.

## Return Type
`int?`

