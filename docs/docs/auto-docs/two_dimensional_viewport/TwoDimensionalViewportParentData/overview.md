# Overview for `TwoDimensionalViewportParentData`

## Description

Parent data structure used by [RenderTwoDimensionalViewport].

 The parent data primarily describes where a child is in the viewport. The
 [layoutOffset] must be set by subclasses of [RenderTwoDimensionalViewport],
 during [RenderTwoDimensionalViewport.layoutChildSequence] which represents
 the position of the child in the viewport.

 The [paintOffset] is computed by [RenderTwoDimensionalViewport] after
 [RenderTwoDimensionalViewport.layoutChildSequence]. If subclasses of
 RenderTwoDimensionalViewport override the paint method, the [paintOffset]
 should be used to position the child in the viewport in order to account for
 a reversed [AxisDirection] in one or both dimensions.

## Dependencies

- ParentData, KeepAliveParentDataMixin

## Members

- **layoutOffset**: `Offset?`
  The offset at which to paint the child in the parent's coordinate system.

 This [Offset] represents the top left corner of the child of the
 [TwoDimensionalViewport].

 This value must be set by implementors during
 [RenderTwoDimensionalViewport.layoutChildSequence]. After the method is
 complete, the [RenderTwoDimensionalViewport] will compute the
 [paintOffset] based on this value to account for the [AxisDirection].

- **vicinity**: `ChildVicinity`
  The logical positioning of children in two dimensions.

 While children may not be strictly laid out in rows and columns, the
 relative positioning determines traversal of
 children in row or column major format.

 This is set in the [RenderTwoDimensionalViewport.buildOrObtainChildFor].

- **_paintExtent**: `Size?`
  Represents the extent in both dimensions of the child that is actually
 visible.

 For example, if a child [RenderBox] had a height of 100 pixels, and a
 width of 100 pixels, but was scrolled to positions such that only 50
 pixels of both width and height were visible, the paintExtent would be
 represented as `Size(50.0, 50.0)`.

 This is set in [RenderTwoDimensionalViewport.updateChildPaintData].

- **_previousSibling**: `RenderBox?`
  The previous sibling in the parent's child list according to the traversal
 order specified by [RenderTwoDimensionalViewport.mainAxis].

- **_nextSibling**: `RenderBox?`
  The next sibling in the parent's child list according to the traversal
 order specified by [RenderTwoDimensionalViewport.mainAxis].

- **paintOffset**: `Offset?`
  The position of the child relative to the bounds and [AxisDirection] of
 the viewport.

 This is the distance from the top left visible corner of the parent to the
 top left visible corner of the child. When the [AxisDirection]s are
 [AxisDirection.down] or [AxisDirection.right], this value is the same as
 the [layoutOffset]. This value deviates when scrolling in the reverse
 directions of [AxisDirection.up] and [AxisDirection.left] to reposition
 the children correctly.

 This is set in [RenderTwoDimensionalViewport.updateChildPaintData], after
 [RenderTwoDimensionalViewport.layoutChildSequence].

 If overriding [RenderTwoDimensionalViewport.paint], use this value to
 position the children instead of [layoutOffset].

