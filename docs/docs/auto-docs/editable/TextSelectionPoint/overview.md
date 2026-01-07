# Overview for `TextSelectionPoint`

## Description

Represents the coordinates of the point in a selection, and the text
 direction at that point, relative to top left of the [RenderEditable] that
 holds the selection.

## Members

- **point**: `Offset`
  Coordinates of the lower left or lower right corner of the selection,
 relative to the top left of the [RenderEditable] object.

- **direction**: `TextDirection?`
  Direction of the text at this edge of the selection.

## Constructors

### Unnamed Constructor
Creates a description of a point in a text selection.

