# Method: `childManager`

## Description

The delegate that manages the children of this object.

 Rather than having a concrete list of children, a
 [RenderSliverMultiBoxAdaptor] uses a [RenderSliverBoxChildManager] to
 create children during layout in order to fill the
 [SliverConstraints.remainingPaintExtent].

## Return Type
`RenderSliverBoxChildManager`

