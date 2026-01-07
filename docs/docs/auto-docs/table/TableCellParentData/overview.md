# Overview for `TableCellParentData`

## Description

Parent data used by [RenderTable] for its children.

## Dependencies

- BoxParentData

## Members

- **verticalAlignment**: `TableCellVerticalAlignment?`
  Where this cell should be placed vertically.

 When using [TableCellVerticalAlignment.baseline], the text baseline must be set as well.

- **x**: `int?`
  The column that the child was in the last time it was laid out.

- **y**: `int?`
  The row that the child was in the last time it was laid out.

