# Overview for `SliverGridGeometry`

## Description

Describes the placement of a child in a [RenderSliverGrid].

 This class is similar to [Rect], in that it gives a two-dimensional position
 and a two-dimensional dimension, but is direction-agnostic.

 
 This example shows how a custom [SliverGridLayout] uses [SliverGridGeometry]
 to lay out the children.

 ** See code in examples/api/lib/widgets/scroll_view/grid_view.0.dart **
 

 See also:

  * [SliverGridLayout], which represents the geometry of all the tiles in a
    grid.
  * [SliverGridLayout.getGeometryForChildIndex], which returns this object
    to describe the child's placement.
  * [RenderSliverGrid], which uses this class during its
    [RenderSliverGrid.performLayout] method.

## Members

- **scrollOffset**: `double`
  The scroll offset of the leading edge of the child relative to the leading
 edge of the parent.

- **crossAxisOffset**: `double`
  The offset of the child in the non-scrolling axis.

 If the scroll axis is vertical, this offset is from the left-most edge of
 the parent to the left-most edge of the child. If the scroll axis is
 horizontal, this offset is from the top-most edge of the parent to the
 top-most edge of the child.

- **mainAxisExtent**: `double`
  The extent of the child in the scrolling axis.

 If the scroll axis is vertical, this extent is the child's height. If the
 scroll axis is horizontal, this extent is the child's width.

- **crossAxisExtent**: `double`
  The extent of the child in the non-scrolling axis.

 If the scroll axis is vertical, this extent is the child's width. If the
 scroll axis is horizontal, this extent is the child's height.

## Constructors

### Unnamed Constructor
Creates an object that describes the placement of a child in a [RenderSliverGrid].

