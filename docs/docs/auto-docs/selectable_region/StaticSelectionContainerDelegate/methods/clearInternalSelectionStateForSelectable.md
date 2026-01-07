# Method: `clearInternalSelectionStateForSelectable`

## Description

Clears the internal selection state for a given [Selectable].

 This indicates that the given `selectable` has neither received a
 start or end [SelectionEdgeUpdateEvent]s.

 Subclasses should call this method to clean up state added in
 [didReceiveSelectionEventFor] and [didReceiveSelectionBoundaryEvents].

## Return Type
`void`

## Parameters

- `selectable`: `Selectable`
