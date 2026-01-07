# Overview for `RenderTreeSliver`

## Description

A sliver that places multiple [TreeSliverNode]s in a linear array along the
 main access, while staggering nodes that are animating into and out of view.

 The extent of each child node is determined by the [itemExtentBuilder].

 See also:

   * [TreeSliver], the widget that creates and manages this render
     object.

## Dependencies

- RenderSliverVariedExtentList

## Members

- **_activeAnimations**: `Map&lt;UniqueKey, TreeSliverNodesAnimation&gt;`
- **_indentation**: `double`
- **_animationLeadingIndices**: `Map&lt;int, UniqueKey&gt;`
- **_animationOffsets**: `Map&lt;UniqueKey, double&gt;`
- **_currentLayoutDimensions**: `SliverLayoutDimensions`
- **_clipHandles**: `Map&lt;UniqueKey, LayerHandle&lt;ClipRectLayer&gt;&gt;`
## Constructors

### Unnamed Constructor
Creates the render object that lays out the [TreeSliverNode]s of a
 [TreeSliver].

