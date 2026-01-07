# Method: `shouldRebuild`

## Description

Whether this delegate is meaningfully different from the old delegate.

 If this returns false, then the header might not be rebuilt, even though
 the instance of the delegate changed.

 This must return true if `oldDelegate` and this object would return
 different values for [minExtent], [maxExtent], [snapConfiguration], or
 would return a meaningfully different widget tree from [build] for the
 same arguments.

## Return Type
`bool`

## Parameters

- `oldDelegate`: `SliverPersistentHeaderDelegate`
