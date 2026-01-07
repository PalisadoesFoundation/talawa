# Overview for `SliverPersistentHeader`

## Description

A sliver whose size varies when the sliver is scrolled to the edge
 of the viewport opposite the sliver's [GrowthDirection].

 In the normal case of a [CustomScrollView] with no centered sliver, this
 sliver will vary its size when scrolled to the leading edge of the viewport.

 This is the layout primitive that [SliverAppBar] uses for its
 shrinking/growing effect.

 _To learn more about slivers, see [CustomScrollView.slivers]._

## Dependencies

- StatelessWidget

## Members

- **delegate**: `SliverPersistentHeaderDelegate`
  Configuration for the sliver's layout.

 The delegate provides the following information:

  * The minimum and maximum dimensions of the sliver.

  * The builder for generating the widgets of the sliver.

  * The instructions for snapping the scroll offset, if [floating] is true.

- **pinned**: `bool`
  Whether to stick the header to the start of the viewport once it has
 reached its minimum size.

 If this is false, the header will continue scrolling off the screen after
 it has shrunk to its minimum extent.

- **floating**: `bool`
  Whether the header should immediately grow again if the user reverses
 scroll direction.

 If this is false, the header only grows again once the user reaches the
 part of the viewport that contains the sliver.

 The [delegate]'s [SliverPersistentHeaderDelegate.snapConfiguration] is
 ignored unless [floating] is true.

## Constructors

### Unnamed Constructor
Creates a sliver that varies its size when it is scrolled to the start of
 a viewport.

