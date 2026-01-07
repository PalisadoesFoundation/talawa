# Overview for `NestedScrollViewViewport`

## Description

The [Viewport] variant used by [NestedScrollView].

 This viewport takes a [SliverOverlapAbsorberHandle] and notifies it any time
 the viewport needs to recompute its layout (e.g. when it is scrolled).

## Dependencies

- Viewport

## Members

- **handle**: `SliverOverlapAbsorberHandle`
  The handle to the [SliverOverlapAbsorber] that is feeding this injector.

## Constructors

### Unnamed Constructor
Creates a variant of [Viewport] that has a [SliverOverlapAbsorberHandle].

