# Method: `build`

## Description

The widget to place inside the [SliverPersistentHeader].

 The `context` is the [BuildContext] of the sliver.

 The `shrinkOffset` is a distance from [maxExtent] towards [minExtent]
 representing the current amount by which the sliver has been shrunk. When
 the `shrinkOffset` is zero, the contents will be rendered with a dimension
 of [maxExtent] in the main axis. When `shrinkOffset` equals the difference
 between [maxExtent] and [minExtent] (a positive number), the contents will
 be rendered with a dimension of [minExtent] in the main axis. The
 `shrinkOffset` will always be a positive number in that range.

 The `overlapsContent` argument is true if subsequent slivers (if any) will
 be rendered beneath this one, and false if the sliver will not have any
 contents below it. Typically this is used to decide whether to draw a
 shadow to simulate the sliver being above the contents below it. Typically
 this is true when `shrinkOffset` is at its greatest value and false
 otherwise, but that is not guaranteed. See [NestedScrollView] for an
 example of a case where `overlapsContent`'s value can be unrelated to
 `shrinkOffset`.

## Return Type
`Widget`

## Parameters

- `context`: `BuildContext`
- `shrinkOffset`: `double`
- `overlapsContent`: `bool`
