# Method: `estimateMaxScrollOffset`

## Description

Returns an estimate of the max scroll extent for all the children.

 Subclasses should override this function if they have additional
 information about their max scroll extent.

 This is used by [SliverMultiBoxAdaptorElement] to implement part of the
 [RenderSliverBoxChildManager] API.

 The default implementation defers to [delegate] via its
 [SliverChildDelegate.estimateMaxScrollOffset] method.

## Return Type
`double?`

## Parameters

- `constraints`: `SliverConstraints?`
- `firstIndex`: `int`
- `lastIndex`: `int`
- `leadingScrollOffset`: `double`
- `trailingScrollOffset`: `double`
