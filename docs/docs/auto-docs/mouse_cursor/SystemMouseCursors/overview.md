# Overview for `SystemMouseCursors`

## Description

A collection of system [MouseCursor]s.

 System cursors are standard mouse cursors that are provided by the current
 platform. They don't require external resources.

 [SystemMouseCursors] is a superset of the system cursors of every platform
 that Flutter supports, therefore some of these objects might map to the same
 result, or fallback to the [basic] arrow. This mapping is defined by the
 Flutter engine.

 The cursors should be named based on the cursors' use cases instead of their
 appearance, because different platforms might (although not commonly) use
 different shapes for the same use case.

## Members

- **none**: `SystemMouseCursor`
  Hide the cursor.

 Any cursor other than [none] or [MouseCursor.uncontrolled] unhides the
 cursor.

- **basic**: `SystemMouseCursor`
  The platform-dependent basic cursor.

 Typically the shape of an arrow.

 Corresponds to:

  * Android: TYPE_DEFAULT, TYPE_ARROW
  * Web: default
  * Windows: IDC_ARROW
  * Windows UWP: CoreCursorType::Arrow
  * Linux: default
  * macOS: arrowCursor

- **click**: `SystemMouseCursor`
  A cursor that emphasizes an element being clickable, such as a hyperlink.

 Typically the shape of a pointing hand.

 Corresponds to:

  * Android: TYPE_HAND
  * Web: pointer
  * Windows: IDC_HAND
  * Windows UWP: CoreCursorType::Hand
  * Linux: pointer
  * macOS: pointingHandCursor

- **forbidden**: `SystemMouseCursor`
  A cursor indicating an operation that will not be carried out.

 Typically the shape of a circle with a diagonal line. May fall back to
 [noDrop].

 Corresponds to:

  * Android: TYPE_NO_DROP
  * Web: not-allowed
  * Windows: IDC_NO
  * Windows UWP: CoreCursorType::UniversalNo
  * Linux: not-allowed
  * macOS: operationNotAllowedCursor

 See also:

  * [noDrop], which indicates somewhere that the current item may not be
    dropped.

- **wait**: `SystemMouseCursor`
  A cursor indicating the status that the program is busy and therefore
 can not be interacted with.

 Typically the shape of an hourglass or a watch.

 This cursor is not available as a system cursor on macOS. Although macOS
 displays a "spinning ball" cursor when busy, it's handled by the OS and not
 exposed for applications to choose.

 Corresponds to:

  * Android: TYPE_WAIT
  * Windows: IDC_WAIT
  * Web: wait
  * Linux: wait

 See also:

  * [progress], which is similar to [wait] but the program can still be
    interacted with.

- **progress**: `SystemMouseCursor`
  A cursor indicating the status that the program is busy but can still be
 interacted with.

 Typically the shape of an arrow with an hourglass or a watch at the corner.
 Does *not* fall back to [wait] if unavailable.

 Corresponds to:

  * Web: progress
  * Windows: IDC_APPSTARTING
  * Linux: progress

 See also:

  * [wait], which is similar to [progress] but the program can not be
    interacted with.

- **contextMenu**: `SystemMouseCursor`
  A cursor indicating somewhere the user can trigger a context menu.

 Typically the shape of an arrow with a small menu at the corner.

 Corresponds to:

  * Android: TYPE_CONTEXT_MENU
  * Web: context-menu
  * Linux: context-menu
  * macOS: contextualMenuCursor

- **help**: `SystemMouseCursor`
  A cursor indicating help information.

 Typically the shape of a question mark, or an arrow therewith.

 Corresponds to:

  * Android: TYPE_HELP
  * Windows: IDC_HELP
  * Windows UWP: CoreCursorType::Help
  * Web: help
  * Linux: help

- **text**: `SystemMouseCursor`
  A cursor indicating selectable text.

 Typically the shape of a capital I.

 Corresponds to:

  * Android: TYPE_TEXT
  * Web: text
  * Windows: IDC_IBEAM
  * Windows UWP: CoreCursorType::IBeam
  * Linux: text
  * macOS: IBeamCursor

- **verticalText**: `SystemMouseCursor`
  A cursor indicating selectable vertical text.

 Typically the shape of a capital I rotated to be horizontal. May fall back
 to [text].

 Corresponds to:

  * Android: TYPE_VERTICAL_TEXT
  * Web: vertical-text
  * Linux: vertical-text
  * macOS: IBeamCursorForVerticalLayout

- **cell**: `SystemMouseCursor`
  A cursor indicating selectable table cells.

 Typically the shape of a hollow plus sign.

 Corresponds to:

  * Android: TYPE_CELL
  * Web: cell
  * Linux: cell

- **precise**: `SystemMouseCursor`
  A cursor indicating precise selection, such as selecting a pixel in a
 bitmap.

 Typically the shape of a crosshair.

 Corresponds to:

  * Android: TYPE_CROSSHAIR
  * Web: crosshair
  * Windows: IDC_CROSS
  * Windows UWP: CoreCursorType::Cross
  * Linux: crosshair
  * macOS: crosshairCursor

- **move**: `SystemMouseCursor`
  A cursor indicating moving something.

 Typically the shape of four-way arrow. May fall back to [allScroll].

 Corresponds to:

  * Android: TYPE_ALL_SCROLL
  * Windows: IDC_SIZEALL
  * Windows UWP: CoreCursorType::SizeAll
  * Web: move
  * Linux: move

- **grab**: `SystemMouseCursor`
  A cursor indicating something that can be dragged.

 Typically the shape of an open hand.

 Corresponds to:

  * Android: TYPE_GRAB
  * Web: grab
  * Linux: grab
  * macOS: openHandCursor

- **grabbing**: `SystemMouseCursor`
  A cursor indicating something that is being dragged.

 Typically the shape of a closed hand.

 Corresponds to:

  * Android: TYPE_GRABBING
  * Web: grabbing
  * Linux: grabbing
  * macOS: closedHandCursor

- **noDrop**: `SystemMouseCursor`
  A cursor indicating somewhere that the current item may not be dropped.

 Typically the shape of a hand with a [forbidden] sign at the corner. May
 fall back to [forbidden].

 Corresponds to:

  * Android: TYPE_NO_DROP
  * Web: no-drop
  * Windows: IDC_NO
  * Windows UWP: CoreCursorType::UniversalNo
  * Linux: no-drop
  * macOS: operationNotAllowedCursor

 See also:

  * [forbidden], which indicates an action that will not be carried out.

- **alias**: `SystemMouseCursor`
  A cursor indicating that the current operation will create an alias of, or
 a shortcut of the item.

 Typically the shape of an arrow with a shortcut icon at the corner.

 Corresponds to:

  * Android: TYPE_ALIAS
  * Web: alias
  * Linux: alias
  * macOS: dragLinkCursor

- **copy**: `SystemMouseCursor`
  A cursor indicating that the current operation will copy the item.

 Typically the shape of an arrow with a boxed plus sign at the corner.

 Corresponds to:

  * Android: TYPE_COPY
  * Web: copy
  * Linux: copy
  * macOS: dragCopyCursor

- **disappearing**: `SystemMouseCursor`
  A cursor indicating that the current operation will result in the
 disappearance of the item.

 Typically the shape of an arrow with a cloud of smoke at the corner.

 Corresponds to:

  * macOS: disappearingItemCursor

- **allScroll**: `SystemMouseCursor`
  A cursor indicating scrolling in any direction.

 Typically the shape of a dot surrounded by 4 arrows.

 Corresponds to:

  * Android: TYPE_ALL_SCROLL
  * Windows: IDC_SIZEALL
  * Windows UWP: CoreCursorType::SizeAll
  * Web: all-scroll
  * Linux: all-scroll

 See also:

  * [move], which indicates moving in any direction.

- **resizeLeftRight**: `SystemMouseCursor`
  A cursor indicating resizing an object bidirectionally from its left or
 right edge.

 Typically the shape of a bidirectional arrow pointing left and right.

 Corresponds to:

  * Android: TYPE_HORIZONTAL_DOUBLE_ARROW
  * Web: ew-resize
  * Windows: IDC_SIZEWE
  * Windows UWP: CoreCursorType::SizeWestEast
  * Linux: ew-resize
  * macOS: resizeLeftRightCursor

- **resizeUpDown**: `SystemMouseCursor`
  A cursor indicating resizing an object bidirectionally from its top or
 bottom edge.

 Typically the shape of a bidirectional arrow pointing up and down.

 Corresponds to:

  * Android: TYPE_VERTICAL_DOUBLE_ARROW
  * Web: ns-resize
  * Windows: IDC_SIZENS
  * Windows UWP: CoreCursorType::SizeNorthSouth
  * Linux: ns-resize
  * macOS: resizeUpDownCursor

- **resizeUpLeftDownRight**: `SystemMouseCursor`
  A cursor indicating resizing an object bidirectionally from its top left or
 bottom right corner.

 Typically the shape of a bidirectional arrow pointing upper left and lower right.

 Corresponds to:

  * Android: TYPE_TOP_LEFT_DIAGONAL_DOUBLE_ARROW
  * Web: nwse-resize
  * Windows: IDC_SIZENWSE
  * Windows UWP: CoreCursorType::SizeNorthwestSoutheast
  * Linux: nwse-resize

- **resizeUpRightDownLeft**: `SystemMouseCursor`
  A cursor indicating resizing an object bidirectionally from its top right or
 bottom left corner.

 Typically the shape of a bidirectional arrow pointing upper right and lower left.

 Corresponds to:

  * Android: TYPE_TOP_RIGHT_DIAGONAL_DOUBLE_ARROW
  * Windows: IDC_SIZENESW
  * Windows UWP: CoreCursorType::SizeNortheastSouthwest
  * Web: nesw-resize
  * Linux: nesw-resize

- **resizeUp**: `SystemMouseCursor`
  A cursor indicating resizing an object from its top edge.

 Typically the shape of an arrow pointing up. May fallback to [resizeUpDown].

 Corresponds to:

  * Android: TYPE_VERTICAL_DOUBLE_ARROW
  * Web: n-resize
  * Windows: IDC_SIZENS
  * Windows UWP: CoreCursorType::SizeNorthSouth
  * Linux: n-resize
  * macOS: resizeUpCursor

- **resizeDown**: `SystemMouseCursor`
  A cursor indicating resizing an object from its bottom edge.

 Typically the shape of an arrow pointing down. May fallback to [resizeUpDown].

 Corresponds to:

  * Android: TYPE_VERTICAL_DOUBLE_ARROW
  * Web: s-resize
  * Windows: IDC_SIZENS
  * Windows UWP: CoreCursorType::SizeNorthSouth
  * Linux: s-resize
  * macOS: resizeDownCursor

- **resizeLeft**: `SystemMouseCursor`
  A cursor indicating resizing an object from its left edge.

 Typically the shape of an arrow pointing left. May fallback to [resizeLeftRight].

 Corresponds to:

  * Android: TYPE_HORIZONTAL_DOUBLE_ARROW
  * Web: w-resize
  * Windows: IDC_SIZEWE
  * Windows UWP: CoreCursorType::SizeWestEast
  * Linux: w-resize
  * macOS: resizeLeftCursor

- **resizeRight**: `SystemMouseCursor`
  A cursor indicating resizing an object from its right edge.

 Typically the shape of an arrow pointing right. May fallback to [resizeLeftRight].

 Corresponds to:

  * Android: TYPE_HORIZONTAL_DOUBLE_ARROW
  * Web: e-resize
  * Windows: IDC_SIZEWE
  * Windows UWP: CoreCursorType::SizeWestEast
  * Linux: e-resize
  * macOS: resizeRightCursor

- **resizeUpLeft**: `SystemMouseCursor`
  A cursor indicating resizing an object from its top-left corner.

 Typically the shape of an arrow pointing upper left. May fallback to [resizeUpLeftDownRight].

 Corresponds to:

  * Android: TYPE_TOP_LEFT_DIAGONAL_DOUBLE_ARROW
  * Web: nw-resize
  * Windows: IDC_SIZENWSE
  * Windows UWP: CoreCursorType::SizeNorthwestSoutheast
  * Linux: nw-resize

- **resizeUpRight**: `SystemMouseCursor`
  A cursor indicating resizing an object from its top-right corner.

 Typically the shape of an arrow pointing upper right. May fallback to [resizeUpRightDownLeft].

 Corresponds to:

  * Android: TYPE_TOP_RIGHT_DIAGONAL_DOUBLE_ARROW
  * Web: ne-resize
  * Windows: IDC_SIZENESW
  * Windows UWP: CoreCursorType::SizeNortheastSouthwest
  * Linux: ne-resize

- **resizeDownLeft**: `SystemMouseCursor`
  A cursor indicating resizing an object from its bottom-left corner.

 Typically the shape of an arrow pointing lower left. May fallback to [resizeUpRightDownLeft].

 Corresponds to:

  * Android: TYPE_TOP_RIGHT_DIAGONAL_DOUBLE_ARROW
  * Web: sw-resize
  * Windows: IDC_SIZENESW
  * Windows UWP: CoreCursorType::SizeNortheastSouthwest
  * Linux: sw-resize

- **resizeDownRight**: `SystemMouseCursor`
  A cursor indicating resizing an object from its bottom-right corner.

 Typically the shape of an arrow pointing lower right. May fallback to [resizeUpLeftDownRight].

 Corresponds to:

  * Android: TYPE_TOP_LEFT_DIAGONAL_DOUBLE_ARROW
  * Web: se-resize
  * Windows: IDC_SIZENWSE
  * Windows UWP: CoreCursorType::SizeNorthwestSoutheast
  * Linux: se-resize

- **resizeColumn**: `SystemMouseCursor`
  A cursor indicating resizing a column, or an item horizontally.

 Typically the shape of arrows pointing left and right with a vertical bar
 separating them. May fallback to [resizeLeftRight].

 Corresponds to:

  * Android: TYPE_HORIZONTAL_DOUBLE_ARROW
  * Web: col-resize
  * Windows: IDC_SIZEWE
  * Windows UWP: CoreCursorType::SizeWestEast
  * Linux: col-resize
  * macOS: resizeLeftRightCursor

- **resizeRow**: `SystemMouseCursor`
  A cursor indicating resizing a row, or an item vertically.

 Typically the shape of arrows pointing up and down with a horizontal bar
 separating them. May fallback to [resizeUpDown].

 Corresponds to:

  * Android: TYPE_VERTICAL_DOUBLE_ARROW
  * Web: row-resize
  * Windows: IDC_SIZENS
  * Windows UWP: CoreCursorType::SizeNorthSouth
  * Linux: row-resize
  * macOS: resizeUpDownCursor

- **zoomIn**: `SystemMouseCursor`
  A cursor indicating zooming in.

 Typically a magnifying glass with a plus sign.

 Corresponds to:

  * Android: TYPE_ZOOM_IN
  * Web: zoom-in
  * Linux: zoom-in

- **zoomOut**: `SystemMouseCursor`
  A cursor indicating zooming out.

 Typically a magnifying glass with a minus sign.

 Corresponds to:

  * Android: TYPE_ZOOM_OUT
  * Web: zoom-out
  * Linux: zoom-out

