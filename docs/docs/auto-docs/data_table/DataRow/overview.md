# Overview for `DataRow`

## Description

Row configuration and cell data for a [DataTable].

 One row configuration must be provided for each row to
 display in the table. The list of [DataRow] objects is passed
 as the `rows` argument to the [DataTable.new] constructor.

 The data for this row of the table is provided in the [cells]
 property of the [DataRow] object.

## Members

- **key**: `LocalKey?`
  A [Key] that uniquely identifies this row. This is used to
 ensure that if a row is added or removed, any stateful widgets
 related to this row (e.g. an in-progress checkbox animation)
 remain on the right row visually.

 If the table never changes once created, no key is necessary.

- **onSelectChanged**: `ValueChanged<bool?>?`
  Called when the user selects or unselects a selectable row.

 If this is not null, then the row is selectable. The current
 selection state of the row is given by [selected].

 If any row is selectable, then the table's heading row will have
 a checkbox that can be checked to select all selectable rows
 (and which is checked if all the rows are selected), and each
 subsequent row will have a checkbox to toggle just that row.

 A row whose [onSelectChanged] callback is null is ignored for
 the purposes of determining the state of the "all" checkbox,
 and its checkbox is disabled.

 If a [DataCell] in the row has its [DataCell.onTap] callback defined,
 that callback behavior overrides the gesture behavior of the row for
 that particular cell.

- **onLongPress**: `GestureLongPressCallback?`
  Called if the row is long-pressed.

 If a [DataCell] in the row has its [DataCell.onTap], [DataCell.onDoubleTap],
 [DataCell.onLongPress], [DataCell.onTapCancel] or [DataCell.onTapDown] callback defined,
 that callback behavior overrides the gesture behavior of the row for
 that particular cell.

- **selected**: `bool`
  Whether the row is selected.

 If [onSelectChanged] is non-null for any row in the table, then
 a checkbox is shown at the start of each row. If the row is
 selected (true), the checkbox will be checked and the row will
 be highlighted.

 Otherwise, the checkbox, if present, will not be checked.

- **cells**: `List&lt;DataCell&gt;`
  The data for this row.

 There must be exactly as many cells as there are columns in the
 table.

- **color**: `MaterialStateProperty<Color?>?`
  The color for the row.

 By default, the color is transparent unless selected. Selected rows has
 a grey translucent color.

 The effective color can depend on the [WidgetState] state, if the
 row is selected, pressed, hovered, focused, disabled or enabled. The
 color is painted as an overlay to the row. To make sure that the row's
 [InkWell] is visible (when pressed, hovered and focused), it is
 recommended to use a translucent color.

 If [onSelectChanged] or [onLongPress] is null, the row's [InkWell] will be disabled.

 ```dart
 DataRow(
   color: WidgetStateProperty.resolveWith<Color?>((Set&lt;WidgetState&gt; states) ),
   cells: const <DataCell>[
     // ...
   ],
 )
 ```

 See also:

  * The Material Design specification for overlay colors and how they
    match a component's state:
    <https://material.io/design/interaction/states.html#anatomy>.

- **mouseCursor**: `MaterialStateProperty<MouseCursor?>?`
  The cursor for a mouse pointer when it enters or is hovering over the
 data row.

 [WidgetStateProperty.resolve] is used for the following [WidgetState]s:

  * [WidgetState.selected].

 If this is null, then the value of [DataTableThemeData.dataRowCursor]
 is used. If that's null, then [WidgetStateMouseCursor.clickable] is used.

 See also:
  * [WidgetStateMouseCursor], which can be used to create a [MouseCursor].

## Constructors

### Unnamed Constructor
Creates the configuration for a row of a [DataTable].

### byIndex
Creates the configuration for a row of a [DataTable], deriving
 the key from a row index.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
