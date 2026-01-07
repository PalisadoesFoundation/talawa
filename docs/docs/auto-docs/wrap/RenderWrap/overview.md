# Overview for `RenderWrap`

## Description

Displays its children in multiple horizontal or vertical runs.

 A [RenderWrap] lays out each child and attempts to place the child adjacent
 to the previous child in the main axis, given by [direction], leaving
 [spacing] space in between. If there is not enough space to fit the child,
 [RenderWrap] creates a new _run_ adjacent to the existing children in the
 cross axis.

 After all the children have been allocated to runs, the children within the
 runs are positioned according to the [alignment] in the main axis and
 according to the [crossAxisAlignment] in the cross axis.

 The runs themselves are then positioned in the cross axis according to the
 [runSpacing] and [runAlignment].

## Dependencies

- RenderBox, ContainerRenderObjectMixin, RenderBoxContainerDefaultsMixin

## Members

- **_direction**: `Axis`
- **_alignment**: `WrapAlignment`
- **_spacing**: `double`
- **_runAlignment**: `WrapAlignment`
- **_runSpacing**: `double`
- **_crossAxisAlignment**: `WrapCrossAlignment`
- **_textDirection**: `TextDirection?`
- **_verticalDirection**: `VerticalDirection`
- **_clipBehavior**: `Clip`
- **_hasVisualOverflow**: `bool`
- **_clipRectLayer**: `LayerHandle&lt;ClipRectLayer&gt;`
## Constructors

### Unnamed Constructor
Creates a wrap render object.

 By default, the wrap layout is horizontal and both the children and the
 runs are aligned to the start.

