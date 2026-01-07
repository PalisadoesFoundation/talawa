# Overview for `RenderSliverFillRemainingWithScrollable`

## Description

A sliver that contains a single box child that contains a scrollable and
 fills the viewport.

 [RenderSliverFillRemainingWithScrollable] sizes its child to fill the
 viewport in the cross axis and to fill the remaining space in the viewport
 in the main axis.

 Typically this will be the last sliver in a viewport, since (by definition)
 there is never any room for anything beyond this sliver.

 See also:

  * [NestedScrollView], which uses this sliver for the inner scrollable.
  * [RenderSliverFillRemaining], which lays out its
    non-scrollable child slightly different than this widget.
  * [RenderSliverFillRemainingAndOverscroll], which incorporates the
    overscroll into the remaining space to fill.
  * [RenderSliverFillViewport], which sizes its children based on the
    size of the viewport, regardless of what else is in the scroll view.
  * [RenderSliverList], which shows a list of variable-sized children in a
    viewport.

## Dependencies

- RenderSliverSingleBoxAdapter

## Constructors

### Unnamed Constructor
Creates a [RenderSliver] that wraps a scrollable [RenderBox] which is
 sized to fit the remaining space in the viewport.

