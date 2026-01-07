# Overview for `TableCell`

## Description

A widget that controls how a child of a [Table] is aligned.

 A [TableCell] widget must be a descendant of a [Table], and the path from
 the [TableCell] widget to its enclosing [Table] must contain only
 [TableRow]s, [StatelessWidget]s, or [StatefulWidget]s (not
 other kinds of widgets, like [RenderObjectWidget]s).

 To create an empty [TableCell], provide a [SizedBox.shrink]
 as the [child].

## Dependencies

- StatelessWidget

## Members

- **verticalAlignment**: `TableCellVerticalAlignment?`
  How this cell is aligned vertically.

- **child**: `Widget`
  The child of this cell.

## Constructors

### Unnamed Constructor
Creates a widget that controls how a child of a [Table] is aligned.

