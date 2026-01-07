# Overview for `RenderSliverOverlapAbsorber`

## Description

A sliver that wraps another, forcing its layout extent to be treated as
 overlap.

 The difference between the overlap requested by the child `sliver` and the
 overlap reported by this widget, called the _absorbed overlap_, is reported
 to the [SliverOverlapAbsorberHandle], which is typically passed to a
 [RenderSliverOverlapInjector].

## Dependencies

- RenderSliver, RenderObjectWithChildMixin

## Members

- **_handle**: `SliverOverlapAbsorberHandle`
## Constructors

### Unnamed Constructor
Create a sliver that absorbs overlap and reports it to a
 [SliverOverlapAbsorberHandle].

 The [sliver] must be a [RenderSliver].

