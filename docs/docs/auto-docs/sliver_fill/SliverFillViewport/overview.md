# Overview for `SliverFillViewport`

## Description

A sliver that contains multiple box children that each fills the viewport.

 _To learn more about slivers, see [CustomScrollView.slivers]._

 [SliverFillViewport] places its children in a linear array along the main
 axis. Each child is sized to fill the viewport, both in the main and cross
 axis.

 See also:

  * [SliverFixedExtentList], which has a configurable
    [SliverFixedExtentList.itemExtent].
  * [SliverPrototypeExtentList], which is similar to [SliverFixedExtentList]
    except that it uses a prototype list item instead of a pixel value to define
    the main axis extent of each item.
  * [SliverList], which does not require its children to have the same
    extent in the main axis.

## Dependencies

- StatelessWidget

## Members

- **viewportFraction**: `double`
  The fraction of the viewport that each child should fill in the main axis.

 If this fraction is less than 1.0, more than one child will be visible at
 once. If this fraction is greater than 1.0, each child will be larger than
 the viewport in the main axis.

- **padEnds**: `bool`
  Whether to add padding to both ends of the list.

 If this is set to true and [viewportFraction] < 1.0, padding will be added
 such that the first and last child slivers will be in the center of the
 viewport when scrolled all the way to the start or end, respectively. You
 may want to set this to false if this [SliverFillViewport] is not the only
 widget along this main axis, such as in a [CustomScrollView] with multiple
 children.

 If [viewportFraction] is greater than one, this option has no effect.
 Defaults to true.

- **delegate**: `SliverChildDelegate`
  

## Constructors

### Unnamed Constructor
Creates a sliver whose box children that each fill the viewport.

