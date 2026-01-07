# Overview for `RenderTable`

## Description

A table where the columns and rows are sized to fit the contents of the cells.

## Dependencies

- RenderBox

## Members

- **_children**: `List<RenderBox?>`
- **_columns**: `int`
- **_rows**: `int`
- **_columnWidths**: `Map&lt;int, TableColumnWidth&gt;`
- **_defaultColumnWidth**: `TableColumnWidth`
- **_textDirection**: `TextDirection`
- **_border**: `TableBorder?`
- **_rowDecorations**: `List<Decoration?>?`
- **_rowDecorationPainters**: `List<BoxPainter?>?`
- **_configuration**: `ImageConfiguration`
- **_defaultVerticalAlignment**: `TableCellVerticalAlignment`
- **_textBaseline**: `TextBaseline?`
- **_idToIndexMap**: `Map&lt;int, _Index&gt;`
- **_cachedRows**: `Map&lt;int, SemanticsNode&gt;`
- **_cachedCells**: `Map&lt;_Index, SemanticsNode&gt;`
- **_baselineDistance**: `double?`
- **_rowTops**: `List&lt;double&gt;`
- **_columnLefts**: `Iterable&lt;double&gt;?`
- **_tableWidth**: `double`
## Constructors

### Unnamed Constructor
Creates a table render object.

  * `columns` must either be null or non-negative. If `columns` is null,
    the number of columns will be inferred from length of the first sublist
    of `children`.
  * `rows` must either be null or non-negative. If `rows` is null, the
    number of rows will be inferred from the `children`. If `rows` is not
    null, then `children` must be null.
  * `children` must either be null or contain lists of all the same length.
    if `children` is not null, then `rows` must be null.
  * [columnWidths] may be null, in which case it defaults to an empty map.

