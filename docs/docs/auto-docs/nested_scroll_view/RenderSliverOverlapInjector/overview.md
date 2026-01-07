# Overview for `RenderSliverOverlapInjector`

## Description

A sliver that has a sliver geometry based on the values stored in a
 [SliverOverlapAbsorberHandle].

 The [RenderSliverOverlapAbsorber] must be an earlier descendant of a common
 ancestor [RenderViewport] (probably a [RenderNestedScrollViewViewport]), so
 that it will always be laid out before the [RenderSliverOverlapInjector]
 during a particular frame.

## Dependencies

- RenderSliver

## Members

- **_currentLayoutExtent**: `double?`
- **_currentMaxExtent**: `double?`
- **_handle**: `SliverOverlapAbsorberHandle`
## Constructors

### Unnamed Constructor
Creates a sliver that is as tall as the value of the given [handle]'s extent.

