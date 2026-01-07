# Overview for `DirectionallyExtendSelectionEvent`

## Description

Extends the current selection with respect to a [direction].

 To handle this event, move the associated selection edge, as dictated by
 [isEnd], according to the [direction].

 The movements are always based on [dx]. The value is in
 global coordinates and is the horizontal offset the selection edge should
 move to when moving to across lines.

## Dependencies

- SelectionEvent

## Members

- **dx**: `double`
  The horizontal offset the selection should move to.

 The offset is in global coordinates.

- **isEnd**: `bool`
  Whether this event is updating the end selection edge.

- **direction**: `SelectionExtendDirection`
  The directional movement of this event.

 See also:
  * [SelectionExtendDirection], which explains how to handle each enum.

## Constructors

### Unnamed Constructor
Creates a [DirectionallyExtendSelectionEvent].

