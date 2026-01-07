# Overview for `IntrinsicColumnWidth`

## Description

Sizes the column according to the intrinsic dimensions of all the
 cells in that column.

 This is a very expensive way to size a column.

 A flex value can be provided. If specified (and non-null), the
 column will participate in the distribution of remaining space
 once all the non-flexible columns have been sized.

## Dependencies

- TableColumnWidth

## Members

- **_flex**: `double?`
## Constructors

### Unnamed Constructor
Creates a column width based on intrinsic sizing.

 This sizing algorithm is very expensive.

 The `flex` argument specifies the flex factor to apply to the column if
 there is any room left over when laying out the table. If `flex` is
 null (the default), the table will not distribute any extra space to the
 column.

