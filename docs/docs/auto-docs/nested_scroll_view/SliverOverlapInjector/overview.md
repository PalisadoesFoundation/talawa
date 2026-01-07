# Overview for `SliverOverlapInjector`

## Description

A sliver that has a sliver geometry based on the values stored in a
 [SliverOverlapAbsorberHandle].

 The [SliverOverlapAbsorber] must be an earlier descendant of a common
 ancestor [Viewport], so that it will always be laid out before the
 [SliverOverlapInjector] during a particular frame.

 See also:

  * [NestedScrollView], which uses a [SliverOverlapAbsorber] to align its
    children, and which shows sample usage for this class.

## Dependencies

- SingleChildRenderObjectWidget

## Members

- **handle**: `SliverOverlapAbsorberHandle`
  The handle to the [SliverOverlapAbsorber] that is feeding this injector.

 This should be a handle owned by a [SliverOverlapAbsorber] and a
 [NestedScrollViewViewport].

## Constructors

### Unnamed Constructor
Creates a sliver that is as tall as the value of the given [handle]'s
 layout extent.

