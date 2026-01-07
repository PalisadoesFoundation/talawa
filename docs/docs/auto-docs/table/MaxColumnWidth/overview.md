# Overview for `MaxColumnWidth`

## Description

Sizes the column such that it is the size that is the maximum of
 two column width specifications.

 For example, to have a column be 10% of the container width or
 100px, whichever is bigger, you could use:

     const MaxColumnWidth(const FixedColumnWidth(100.0), FractionColumnWidth(0.1))

 Both specifications are evaluated, so if either specification is
 expensive, so is this.

## Dependencies

- TableColumnWidth

## Members

- **a**: `TableColumnWidth`
  A lower bound for the width of this column.

- **b**: `TableColumnWidth`
  Another lower bound for the width of this column.

## Constructors

### Unnamed Constructor
Creates a column width that is the maximum of two other column widths.

