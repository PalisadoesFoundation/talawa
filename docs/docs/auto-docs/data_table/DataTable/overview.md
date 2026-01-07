# Overview for `DataTable`

## Description

A data table that follows the
 [Material 2](https://material.io/go/design-data-tables)
 design specification.

 

 ## Performance considerations

 Columns are sized automatically based on the table's contents.
 It's expensive to display large amounts of data with this widget,
 since it must be measured twice: once to negotiate each column's
 dimensions, and again when the table is laid out.

 A [SingleChildScrollView] mounts and paints the entire child, even
 when only some of it is visible. For a table that effectively handles
 large amounts of data, here are some other options to consider:

  * `TableView`, a widget from the
    [two_dimensional_scrollables](https://pub.dev/packages/two_dimensional_scrollables)
    package.
  * [PaginatedDataTable], which automatically splits the data into
    multiple pages.
  * [CustomScrollView], for greater control over scrolling effects.

 
 This sample shows how to display a [DataTable] with three columns: name, age, and
 role. The columns are defined by three [DataColumn] objects. The table
 contains three rows of data for three example users, the data for which
 is defined by three [DataRow] objects.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/data_table.png)

 ** See code in examples/api/lib/material/data_table/data_table.0.dart **
 


 
 This sample shows how to display a [DataTable] with alternate colors per
 row, and a custom color for when the row is selected.

 ** See code in examples/api/lib/material/data_table/data_table.1.dart **
 

 [DataTable] can be sorted on the basis of any column in [columns] in
 ascending or descending order. If [sortColumnIndex] is non-null, then the
 table will be sorted by the values in the specified column. The boolean
 [sortAscending] flag controls the sort order.

 See also:

  * [DataColumn], which describes a column in the data table.
  * [DataRow], which contains the data for a row in the data table.
  * [DataCell], which contains the data for a single cell in the data table.
  * [PaginatedDataTable], which shows part of the data in a data table and
    provides controls for paging through the remainder of the data.
  * `TableView` from the
    [two_dimensional_scrollables](https://pub.dev/packages/two_dimensional_scrollables)
    package, for displaying large amounts of data without pagination.
  * <https://material.io/go/design-data-tables>

## Dependencies

- StatelessWidget

## Members

- **columns**: `List&lt;DataColumn&gt;`
  The configuration and labels for the columns in the table.

- **sortColumnIndex**: `int?`
  The current primary sort key's column.

 If non-null, indicates that the indicated column is the column
 by which the data is sorted. The number must correspond to the
 index of the relevant column in [columns].

 Setting this will cause the relevant column to have a sort
 indicator displayed.

 When this is null, it implies that the table's sort order does
 not correspond to any of the columns.

 The direction of the sort is specified using [sortAscending].

- **sortAscending**: `bool`
  Whether the column mentioned in [sortColumnIndex], if any, is sorted
 in ascending order.

 If true, the order is ascending (meaning the rows with the
 smallest values for the current sort column are first in the
 table).

 If false, the order is descending (meaning the rows with the
 smallest values for the current sort column are last in the
 table).

 Ascending order is represented by an upwards-facing arrow.

- **onSelectAll**: `ValueSetter<bool?>?`
  Invoked when the user selects or unselects every row, using the
 checkbox in the heading row.

 If this is null, then the [DataRow.onSelectChanged] callback of
 every row in the table is invoked appropriately instead.

 To control whether a particular row is selectable or not, see
 [DataRow.onSelectChanged]. This callback is only relevant if any
 row is selectable.

- **decoration**: `Decoration?`
  
 The background and border decoration for the table.
 

 If null, [DataTableThemeData.decoration] is used. By default there is no
 decoration.

- **dataRowColor**: `MaterialStateProperty<Color?>?`
  
 The background color for the data rows.

 The effective background color can be made to depend on the
 [WidgetState] state, i.e. if the row is selected, pressed, hovered,
 focused, disabled or enabled. The color is painted as an overlay to the
 row. To make sure that the row's [InkWell] is visible (when pressed,
 hovered and focused), it is recommended to use a translucent background
 color.

 If [DataRow.onSelectChanged] or [DataRow.onLongPress] is null, the row's
 [InkWell] will be disabled.
 

 If null, [DataTableThemeData.dataRowColor] is used. By default, the
 background color is transparent unless selected. Selected rows have a grey
 translucent color. To set a different color for individual rows, see
 [DataRow.color].

 
 ```dart
 DataTable(
   dataRowColor: WidgetStateProperty.resolveWith<Color?>((Set&lt;WidgetState&gt; states) ),
   columns: _columns,
   rows: _rows,
 )
 ```

 See also:

  * The Material Design specification for overlay colors and how they
    match a component's state:
    <https://material.io/design/interaction/states.html#anatomy>.
 

- **dataRowMinHeight**: `double?`
  
 The minimum height of each row (excluding the row that contains column headings).
 

 If null, [DataTableThemeData.dataRowMinHeight] is used. This value defaults
 to [kMinInteractiveDimension] to adhere to the Material Design
 specifications.

- **dataRowMaxHeight**: `double?`
  
 The maximum height of each row (excluding the row that contains column headings).
 

 If null, [DataTableThemeData.dataRowMaxHeight] is used. This value defaults
 to [kMinInteractiveDimension] to adhere to the Material Design
 specifications.

- **dataTextStyle**: `TextStyle?`
  
 The text style for data rows.
 

 If null, [DataTableThemeData.dataTextStyle] is used. By default, the text
 style is [TextTheme.bodyMedium].

- **headingRowColor**: `MaterialStateProperty<Color?>?`
  
 The background color for the heading row.

 The effective background color can be made to depend on the
 [WidgetState] state, i.e. if the row is pressed, hovered, focused when
 sorted. The color is painted as an overlay to the row. To make sure that
 the row's [InkWell] is visible (when pressed, hovered and focused), it is
 recommended to use a translucent color.
 

 If null, [DataTableThemeData.headingRowColor] is used.

 
 ```dart
 DataTable(
   columns: _columns,
   rows: _rows,
   headingRowColor: WidgetStateProperty.resolveWith<Color?>((Set&lt;WidgetState&gt; states) ),
 )
 ```

 See also:

  * The Material Design specification for overlay colors and how they
    match a component's state:
    <https://material.io/design/interaction/states.html#anatomy>.
 

- **headingRowHeight**: `double?`
  
 The height of the heading row.
 

 If null, [DataTableThemeData.headingRowHeight] is used. This value
 defaults to 56.0 to adhere to the Material Design specifications.

- **headingTextStyle**: `TextStyle?`
  
 The text style for the heading row.
 

 If null, [DataTableThemeData.headingTextStyle] is used. By default, the
 text style is [TextTheme.titleSmall].

- **horizontalMargin**: `double?`
  
 The horizontal margin between the edges of the table and the content
 in the first and last cells of each row.

 When a checkbox is displayed, it is also the margin between the checkbox
 the content in the first data column.
 

 If null, [DataTableThemeData.horizontalMargin] is used. This value
 defaults to 24.0 to adhere to the Material Design specifications.

 If [checkboxHorizontalMargin] is null, then [horizontalMargin] is also the
 margin between the edge of the table and the checkbox, as well as the
 margin between the checkbox and the content in the first data column.

- **columnSpacing**: `double?`
  
 The horizontal margin between the contents of each data column.
 

 If null, [DataTableThemeData.columnSpacing] is used. This value defaults
 to 56.0 to adhere to the Material Design specifications.

- **showCheckboxColumn**: `bool`
  
 Whether the widget should display checkboxes for selectable rows.

 If true, a [Checkbox] will be placed at the beginning of each row that is
 selectable. However, if [DataRow.onSelectChanged] is not set for any row,
 checkboxes will not be placed, even if this value is true.

 If false, all rows will not display a [Checkbox].
 

- **rows**: `List&lt;DataRow&gt;`
  The data to show in each row (excluding the row that contains
 the column headings).

 The list may be empty.

- **dividerThickness**: `double?`
  
 The width of the divider that appears between [TableRow]s.

 Must be greater than or equal to zero.
 

 If null, [DataTableThemeData.dividerThickness] is used. This value
 defaults to 1.0.

- **showBottomBorder**: `bool`
  Whether a border at the bottom of the table is displayed.

 By default, a border is not shown at the bottom to allow for a border
 around the table defined by [decoration].

- **checkboxHorizontalMargin**: `double?`
  
 Horizontal margin around the checkbox, if it is displayed.
 

 If null, [DataTableThemeData.checkboxHorizontalMargin] is used. If that is
 also null, then [horizontalMargin] is used as the margin between the edge
 of the table and the checkbox, as well as the margin between the checkbox
 and the content in the first data column. This value defaults to 24.0.

- **border**: `TableBorder?`
  The style to use when painting the boundary and interior divisions of the table.

- **clipBehavior**: `Clip`
  

 This can be used to clip the content within the border of the [DataTable].

 Defaults to [Clip.none].

- **_onlyTextColumn**: `int?`
- **_headingRowKey**: `LocalKey`
- **_headingRowHeight**: `double`
  The default height of the heading row.

- **_horizontalMargin**: `double`
  The default horizontal margin between the edges of the table and the content
 in the first and last cells of each row.

- **_columnSpacing**: `double`
  The default horizontal margin between the contents of each data column.

- **_sortArrowPadding**: `double`
  The default padding between the heading content and sort arrow.

- **_dividerThickness**: `double`
  The default divider thickness.

- **_sortArrowAnimationDuration**: `Duration`
## Constructors

### Unnamed Constructor
Creates a widget describing a data table.

 The [columns] argument must be a list of as many [DataColumn]
 objects as the table is to have columns, ignoring the leading
 checkbox column if any. The [columns] argument must have a
 length greater than zero.

 The [rows] argument must be a list of as many [DataRow] objects
 as the table is to have rows, ignoring the leading heading row
 that contains the column headings (derived from the [columns]
 argument). There may be zero rows, but the rows argument must
 not be null.

 Each [DataRow] object in [rows] must have as many [DataCell]
 objects in the [DataRow.cells] list as the table has columns.

 If the table is sorted, the column that provides the current
 primary key should be specified by index in [sortColumnIndex], 0
 meaning the first column in [columns], 1 being the next one, and
 so forth.

 The actual sort order can be specified using [sortAscending]; if
 the sort order is ascending, this should be true (the default),
 otherwise it should be false.

