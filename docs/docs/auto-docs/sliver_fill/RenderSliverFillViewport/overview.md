# Overview for `RenderSliverFillViewport`

## Description

A sliver that contains multiple box children that each fill the viewport.

 [RenderSliverFillViewport] places its children in a linear array along the
 main axis. Each child is sized to fill the viewport, both in the main and
 cross axis. A [viewportFraction] factor can be provided to size the children
 to a multiple of the viewport's main axis dimension (typically a fraction
 less than 1.0).

 See also:

  * [RenderSliverFillRemaining], which sizes the children based on the
    remaining space rather than the viewport itself.
  * [RenderSliverFixedExtentList], which has a configurable [itemExtent].
  * [RenderSliverList], which does not require its children to have the same
    extent in the main axis.

## Dependencies

- RenderSliverFixedExtentBoxAdaptor

## Members

- **_viewportFraction**: `double`
## Constructors

### Unnamed Constructor
Creates a sliver that contains multiple box children that each fill the
 viewport.

