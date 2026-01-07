# Overview for `RenderListBody`

## Description

Displays its children sequentially along a given axis, forcing them to the
 dimensions of the parent in the other axis.

 This layout algorithm arranges its children linearly along the main axis
 (either horizontally or vertically). In the cross axis, children are
 stretched to match the box's cross-axis extent. In the main axis, children
 are given unlimited space and the box expands its main axis to contain all
 its children. Because [RenderListBody] boxes expand in the main axis, they
 must be given unlimited space in the main axis, typically by being contained
 in a viewport with a scrolling direction that matches the box's main axis.

## Dependencies

- RenderBox, ContainerRenderObjectMixin, RenderBoxContainerDefaultsMixin

## Members

- **_axisDirection**: `AxisDirection`
## Constructors

### Unnamed Constructor
Creates a render object that arranges its children sequentially along a
 given axis.

 By default, children are arranged along the vertical axis.

