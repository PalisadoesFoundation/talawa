# Overview for `SliverOverlapAbsorber`

## Description

A sliver that wraps another, forcing its layout extent to be treated as
 overlap.

 The difference between the overlap requested by the child `sliver` and the
 overlap reported by this widget, called the _absorbed overlap_, is reported
 to the [SliverOverlapAbsorberHandle], which is typically passed to a
 [SliverOverlapInjector].

 See also:

  * [NestedScrollView], whose documentation has sample code showing how to
    use this widget.

## Dependencies

- SingleChildRenderObjectWidget

## Members

- **handle**: `SliverOverlapAbsorberHandle`
  The object in which the absorbed overlap is recorded.

 A particular [SliverOverlapAbsorberHandle] can only be assigned to a
 single [SliverOverlapAbsorber] at a time.

## Constructors

### Unnamed Constructor
Creates a sliver that absorbs overlap and reports it to a
 [SliverOverlapAbsorberHandle].

