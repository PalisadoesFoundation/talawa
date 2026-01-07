# Overview for `SliverLayoutBuilder`

## Description

Builds a sliver widget tree that can depend on its own [SliverConstraints].

 Similar to the [LayoutBuilder] widget except its builder should return a sliver
 widget, and [SliverLayoutBuilder] is itself a sliver. The framework calls the
 [builder] function at layout time and provides the current [SliverConstraints].
 The [SliverLayoutBuilder]'s final [SliverGeometry] will match the [SliverGeometry]
 of its child.

 

 See also:

  * [LayoutBuilder], the non-sliver version of this widget.

## Dependencies

- ConstrainedLayoutBuilder

## Constructors

### Unnamed Constructor
Creates a sliver widget that defers its building until layout.

