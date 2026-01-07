# Overview for `DataCell`

## Description

The data for a cell of a [DataTable].

 One list of [DataCell] objects must be provided for each [DataRow]
 in the [DataTable], in the new [DataRow] constructor's `cells`
 argument.

## Members

- **empty**: `DataCell`
  A cell that has no content and has zero width and height.

- **child**: `Widget`
  The data for the row.

 Typically a [Text] widget or a [DropdownButton] widget.

 If the cell has no data, then a [Text] widget with placeholder
 text should be provided instead, and [placeholder] should be set
 to true.

 

- **placeholder**: `bool`
  Whether the [child] is actually a placeholder.

 If this is true, the default text style for the cell is changed
 to be appropriate for placeholder text.

- **showEditIcon**: `bool`
  Whether to show an edit icon at the end of the cell.

 This does not make the cell actually editable; the caller must
 implement editing behavior if desired (initiated from the
 [onTap] callback).

 If this is set, [onTap] should also be set, otherwise tapping
 the icon will have no effect.

- **onTap**: `GestureTapCallback?`
  Called if the cell is tapped.

 If non-null, tapping the cell will call this callback. If
 null (including [onDoubleTap], [onLongPress], [onTapCancel] and [onTapDown]),
 tapping the cell will attempt to select the row (if
 [DataRow.onSelectChanged] is provided).

- **onDoubleTap**: `GestureTapCallback?`
  Called when the cell is double tapped.

 If non-null, tapping the cell will call this callback. If
 null (including [onTap], [onLongPress], [onTapCancel] and [onTapDown]),
 tapping the cell will attempt to select the row (if
 [DataRow.onSelectChanged] is provided).

- **onLongPress**: `GestureLongPressCallback?`
  Called if the cell is long-pressed.

 If non-null, tapping the cell will invoke this callback. If
 null (including [onDoubleTap], [onTap], [onTapCancel] and [onTapDown]),
 tapping the cell will attempt to select the row (if
 [DataRow.onSelectChanged] is provided).

- **onTapDown**: `GestureTapDownCallback?`
  Called if the cell is tapped down.

 If non-null, tapping the cell will call this callback. If
 null (including [onTap] [onDoubleTap], [onLongPress] and [onTapCancel]),
 tapping the cell will attempt to select the row (if
 [DataRow.onSelectChanged] is provided).

- **onTapCancel**: `GestureTapCancelCallback?`
  Called if the user cancels a tap was started on cell.

 If non-null, canceling the tap gesture will invoke this callback.
 If null (including [onTap], [onDoubleTap] and [onLongPress]),
 tapping the cell will attempt to select the
 row (if [DataRow.onSelectChanged] is provided).

## Constructors

### Unnamed Constructor
Creates an object to hold the data for a cell in a [DataTable].

 The first argument is the widget to show for the cell, typically
 a [Text] or [DropdownButton] widget.

 If the cell has no data, then a [Text] widget with placeholder
 text should be provided instead, and then the [placeholder]
 argument should be set to true.

