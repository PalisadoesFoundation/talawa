# Overview for `SelectionEvent`

## Description

An abstract base class for selection events.

 This should not be directly used. To handle a selection event, it should
 be downcast to a specific subclass. One can use [type] to look up which
 subclasses to downcast to.

 See also:
 * [SelectAllSelectionEvent], for events to select all contents.
 * [ClearSelectionEvent], for events to clear selections.
 * [SelectWordSelectionEvent], for events to select words at the locations.
 * [SelectionEdgeUpdateEvent], for events to update selection edges.
 * [SelectionEventType], for determining the subclass types.

## Members

- **type**: `SelectionEventType`
  The type of this selection event.

## Constructors

### _


#### Parameters

- `type`: `dynamic`
