# Overview for `TableRow`

## Description

A horizontal group of cells in a [Table].

 Every row in a table must have the same number of children.

 The alignment of individual cells in a row can be controlled using a
 [TableCell].

## Members

- **key**: `LocalKey?`
  An identifier for the row.

- **decoration**: `Decoration?`
  A decoration to paint behind this row.

 Row decorations fill the horizontal and vertical extent of each row in
 the table, unlike decorations for individual cells, which might not fill
 either.

- **children**: `List&lt;Widget&gt;`
  The widgets that comprise the cells in this row.

 Children may be wrapped in [TableCell] widgets to provide per-cell
 configuration to the [Table], but children are not required to be wrapped
 in [TableCell] widgets.

## Constructors

### Unnamed Constructor
Creates a row in a [Table].

