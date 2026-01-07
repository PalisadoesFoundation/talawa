# Overview for `DataColumn`

## Description

Column configuration for a [DataTable].

 One column configuration must be provided for each column to
 display in the table. The list of [DataColumn] objects is passed
 as the `columns` argument to the [DataTable.new] constructor.

## Members

- **label**: `Widget`
  The column heading.

 Typically, this will be a [Text] widget. It could also be an
 [Icon] (typically using size 18), or a [Row] with an icon and
 some text.

 The [label] is placed within a [Row] along with the
 sort indicator (if applicable). By default, [label] only occupy minimal
 space. It is recommended to place the label content in an [Expanded] or
 [Flexible] as [label] to control how the content flexes. Otherwise,
 an exception will occur when the available space is insufficient.

 By default, [DefaultTextStyle.softWrap] of this subtree will be set to false.
 Use [DefaultTextStyle.merge] to override it if needed.

 The label should not include the sort indicator.

- **columnWidth**: `TableColumnWidth?`
  How the horizontal extents of this column of the table should be determined.

 The [FixedColumnWidth] class can be used to specify a specific width in
 pixels. This is the cheapest way to size a table's columns.

 The layout performance of the table depends critically on which column
 sizing algorithms are used here. In particular, [IntrinsicColumnWidth] is
 quite expensive because it needs to measure each cell in the column to
 determine the intrinsic size of the column.

 If this property is `null`, the table applies a default behavior:
 - If the table has exactly one column identified as the only text column
   (i.e., all the rest are numeric), that column uses `IntrinsicColumnWidth(flex: 1.0)`.
 - All other columns use ``.

- **tooltip**: `String?`
  The column heading's tooltip.

 This is a longer description of the column heading, for cases
 where the heading might have been abbreviated to keep the column
 width to a reasonable size.

- **numeric**: `bool`
  Whether this column represents numeric data or not.

 The contents of cells of columns containing numeric data are
 right-aligned.

- **onSort**: `DataColumnSortCallback?`
  Called when the user asks to sort the table using this column.

 If null, the column will not be considered sortable.

 See [DataTable.sortColumnIndex] and [DataTable.sortAscending].

- **mouseCursor**: `MaterialStateProperty<MouseCursor?>?`
  The cursor for a mouse pointer when it enters or is hovering over the
 heading row.

 [WidgetStateProperty.resolve] is used for the following [WidgetState]s:

  * [WidgetState.disabled].

 If this is null, then the value of [DataTableThemeData.headingCellCursor]
 is used. If that's null, then [WidgetStateMouseCursor.clickable] is used.

 See also:
  * [WidgetStateMouseCursor], which can be used to create a [MouseCursor].

- **headingRowAlignment**: `MainAxisAlignment?`
  Defines the horizontal layout of the [label] and sort indicator in the
 heading row.

 If [headingRowAlignment] value is [MainAxisAlignment.center] and [onSort] is
 not null, then a [SizedBox] with a width of sort arrow icon size and sort
 arrow padding will be placed before the [label] to ensure the label is
 centered in the column.

 If null, then defaults to [MainAxisAlignment.start].

## Constructors

### Unnamed Constructor
Creates the configuration for a column of a [DataTable].

