# Overview for `MinColumnWidth`

## Description

Sizes the column such that it is the size that is the minimum of
 two column width specifications.

 For example, to have a column be 10% of the container width but
 never bigger than 100px, you could use:

     const MinColumnWidth(const FixedColumnWidth(100.0), FractionColumnWidth(0.1))

 Both specifications are evaluated, so if either specification is
 expensive, so is this.

## Dependencies

- TableColumnWidth

## Members

- **a**: `TableColumnWidth`
  An upper bound for the width of this column.

- **b**: `TableColumnWidth`
  Another upper bound for the width of this column.

## Constructors

### Unnamed Constructor
Creates a column width that is the minimum of two other column widths.

