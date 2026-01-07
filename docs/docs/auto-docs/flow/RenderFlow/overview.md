# Overview for `RenderFlow`

## Description

Implements the flow layout algorithm.

 Flow layouts are optimized for repositioning children using transformation
 matrices.

 The flow container is sized independently from the children by the
 [FlowDelegate.getSize] function of the delegate. The children are then sized
 independently given the constraints from the
 [FlowDelegate.getConstraintsForChild] function.

 Rather than positioning the children during layout, the children are
 positioned using transformation matrices during the paint phase using the
 matrices from the [FlowDelegate.paintChildren] function. The children are thus
 repositioned efficiently by repainting the flow, skipping layout.

 The most efficient way to trigger a repaint of the flow is to supply a
 repaint argument to the constructor of the [FlowDelegate]. The flow will
 listen to this animation and repaint whenever the animation ticks, avoiding
 both the build and layout phases of the pipeline.

 See also:

  * [FlowDelegate]
  * [RenderStack]

## Dependencies

- RenderBox, ContainerRenderObjectMixin, RenderBoxContainerDefaultsMixin, FlowPaintingContext

## Members

- **_delegate**: `FlowDelegate`
- **_clipBehavior**: `Clip`
- **_randomAccessChildren**: `List&lt;RenderBox&gt;`
- **_lastPaintOrder**: `List&lt;int&gt;`
- **_paintingContext**: `PaintingContext?`
- **_paintingOffset**: `Offset?`
- **_clipRectLayer**: `LayerHandle&lt;ClipRectLayer&gt;`
## Constructors

### Unnamed Constructor
Creates a render object for a flow layout.

 For optimal performance, consider using children that return true from
 [isRepaintBoundary].

