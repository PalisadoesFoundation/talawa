# Overview for `TableColumnWidth`

## Description

Base class to describe how wide a column in a [RenderTable] should be.

 To size a column to a specific number of pixels, use a [FixedColumnWidth].
 This is the cheapest way to size a column.

 Other algorithms that are relatively cheap include [FlexColumnWidth], which
 distributes the space equally among the flexible columns,
 [FractionColumnWidth], which sizes a column based on the size of the
 table's container.

## Constructors

### Unnamed Constructor
Abstract const constructor. This constructor enables subclasses to provide
 const constructors so that they can be used in const expressions.

