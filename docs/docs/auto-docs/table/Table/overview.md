# Overview for `Table`

## Description

A widget that uses the table layout algorithm for its children.

 

 
 This sample shows a [Table] with borders, multiple types of column widths
 and different vertical cell alignments.

 ** See code in examples/api/lib/widgets/table/table.0.dart **
 

 If you only have one row, the [Row] widget is more appropriate. If you only
 have one column, the [SliverList] or [Column] widgets will be more
 appropriate.

 Rows size vertically based on their contents. To control the individual
 column widths, use the [columnWidths] property to specify a
 [TableColumnWidth] for each column. If [columnWidths] is null, or there is a
 null entry for a given column in [columnWidths], the table uses the
 [defaultColumnWidth] instead.

 By default, [defaultColumnWidth] is a [FlexColumnWidth]. This
 [TableColumnWidth] divides up the remaining space in the horizontal axis to
 determine the column width. If wrapping a [Table] in a horizontal
 [ScrollView], choose a different [TableColumnWidth], such as
 [FixedColumnWidth].

 For more details about the table layout algorithm, see [RenderTable].
 To control the alignment of children, see [TableCell].

 See also:

  * The [catalog of layout widgets](https://flutter.dev/widgets/layout/).

## Dependencies

- RenderObjectWidget

## Members

- **children**: `List&lt;TableRow&gt;`
  The rows of the table.

 Every row in a table must have the same number of children.

- **columnWidths**: `Map&lt;int, TableColumnWidth&gt;?`
  How the horizontal extents of the columns of this table should be determined.

 If the [Map] has a null entry for a given column, the table uses the
 [defaultColumnWidth] instead. By default, that uses flex sizing to
 distribute free space equally among the columns.

 The [FixedColumnWidth] class can be used to specify a specific width in
 pixels. That is the cheapest way to size a table's columns.

 The layout performance of the table depends critically on which column
 sizing algorithms are used here. In particular, [IntrinsicColumnWidth] is
 quite expensive because it needs to measure each cell in the column to
 determine the intrinsic size of the column.

 The keys of this map (column indexes) are zero-based.

 If this is set to null, then an empty map is assumed.

- **defaultColumnWidth**: `TableColumnWidth`
  How to determine with widths of columns that don't have an explicit sizing
 algorithm.

 Specifically, the [defaultColumnWidth] is used for column `i` if
 `columnWidths[i]` is null. Defaults to [FlexColumnWidth], which will
 divide the remaining horizontal space up evenly between columns of the
 same type [TableColumnWidth].

 A [Table] in a horizontal [ScrollView] must use a [FixedColumnWidth], or
 an [IntrinsicColumnWidth] as the horizontal space is infinite.

- **textDirection**: `TextDirection?`
  The direction in which the columns are ordered.

 Defaults to the ambient [Directionality].

- **border**: `TableBorder?`
  The style to use when painting the boundary and interior divisions of the table.

- **defaultVerticalAlignment**: `TableCellVerticalAlignment`
  How cells that do not explicitly specify a vertical alignment are aligned vertically.

 Cells may specify a vertical alignment by wrapping their contents in a
 [TableCell] widget.

- **textBaseline**: `TextBaseline?`
  The text baseline to use when aligning rows using [TableCellVerticalAlignment.baseline].

 This must be set if using baseline alignment. There is no default because there is no
 way for the framework to know the correct baseline _a priori_.

- **_rowDecorations**: `List<Decoration?>?`
## Constructors

### Unnamed Constructor
Creates a table.

