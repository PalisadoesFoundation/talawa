# Overview for `SliverResizingHeader`

## Description

A sliver that is pinned to the start of its [CustomScrollView] and
 reacts to scrolling by resizing between the intrinsic sizes of its
 min and max extent prototypes.

 The minimum and maximum sizes of this sliver are defined by [minExtentPrototype]
 and [maxExtentPrototype], a pair of widgets that are laid out once. You can
 use [SizedBox] widgets to define the size limits.

 If the [minExtentPrototype] is null, then the default minimum extent is 0. If
 [maxExtentPrototype] is null then the default maximum extent is based on the child's
 intrinsic size.

 This sliver is preferable to the general purpose [SliverPersistentHeader]
 for its relatively narrow use case because there's no need to create a
 [SliverPersistentHeaderDelegate] or to predict the header's minimum or
 maximum size.

 
 This sample shows how this sliver's two extent prototype properties can be used to
 create a resizing header whose minimum and maximum sizes match small and large
 configurations of the same header widget.

 ** See code in examples/api/lib/widgets/sliver/sliver_resizing_header.0.dart **
 

 See also:

  * [PinnedHeaderSliver] - which just pins the header at the top
    of the [CustomScrollView].
  * [SliverFloatingHeader] - which animates the header in and out of view
    in response to downward and upwards scrolls.
  * [SliverPersistentHeader] - a general purpose header that can be
    configured as a pinned, resizing, or floating header.

## Dependencies

- StatelessWidget

## Members

- **minExtentPrototype**: `Widget?`
  Laid out once to define the minimum size of this sliver along the
 [CustomScrollView.scrollDirection] axis.

 If null, the minimum size of the sliver is 0.

 This widget is never made visible.

- **maxExtentPrototype**: `Widget?`
  Laid out once to define the maximum size of this sliver along the
 [CustomScrollView.scrollDirection] axis.

 If null, the maximum extent of the sliver is based on the child's
 intrinsic size.

 This widget is never made visible.

- **child**: `Widget?`
  The widget contained by this sliver.

## Constructors

### Unnamed Constructor
Create a pinned header sliver that reacts to scrolling by resizing between
 the intrinsic sizes of the min and max extent prototypes.

