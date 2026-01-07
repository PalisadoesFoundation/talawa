# Overview for `SelectionGeometry`

## Description

The geometry of the current selection.

 This includes details such as the locations of the selection start and end,
 line height, the rects that encompass the selection, etc. This information
 is used for drawing selection controls for mobile platforms.

 The positions in geometry are in local coordinates of the [SelectionHandler]
 or [Selectable].

## Dependencies

- Diagnosticable

## Members

- **startSelectionPoint**: `SelectionPoint?`
  The geometry information at the selection start.

 This information is used for drawing mobile selection controls. The
 [SelectionPoint.localPosition] of the selection start is typically at the
 start of the selection highlight at where the start selection handle
 should be drawn.

 The [SelectionPoint.handleType] should be [TextSelectionHandleType.left]
 for forward selection or [TextSelectionHandleType.right] for backward
 selection in most cases.

 Can be null if the selection start is offstage, for example, when the
 selection is outside of the viewport or is kept alive by a scrollable.

- **endSelectionPoint**: `SelectionPoint?`
  The geometry information at the selection end.

 This information is used for drawing mobile selection controls. The
 [SelectionPoint.localPosition] of the selection end is typically at the end
 of the selection highlight at where the end selection handle should be
 drawn.

 The [SelectionPoint.handleType] should be [TextSelectionHandleType.right]
 for forward selection or [TextSelectionHandleType.left] for backward
 selection in most cases.

 Can be null if the selection end is offstage, for example, when the
 selection is outside of the viewport or is kept alive by a scrollable.

- **status**: `SelectionStatus`
  The status of ongoing selection in the [Selectable] or [SelectionHandler].

- **selectionRects**: `List&lt;Rect&gt;`
  The rects in the local coordinates of the containing [Selectable] that
 represent the selection if there is any.

- **hasContent**: `bool`
  Whether there is any selectable content in the [Selectable] or
 [SelectionHandler].

## Constructors

### Unnamed Constructor
Creates a selection geometry object.

 If any of the [startSelectionPoint] and [endSelectionPoint] is not null,
 the [status] must not be [SelectionStatus.none].

