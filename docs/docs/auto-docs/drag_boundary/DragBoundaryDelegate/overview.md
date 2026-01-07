# Overview for `DragBoundaryDelegate`

## Description

The interface for defining the algorithm for a boundary that a specified shape is dragged within.

 See also:
  * [DragBoundary], an [InheritedWidget] that provides a [DragBoundaryDelegate] to its descendants.

 `T` is a data class that defines the shape being dragged. For example, when dragging a rectangle within the boundary,
 `T` should be a `Rect`.

