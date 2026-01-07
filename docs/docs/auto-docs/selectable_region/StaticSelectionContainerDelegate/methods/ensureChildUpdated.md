# Method: `ensureChildUpdated`

## Description

Ensures the `selectable` child has received the most up to date selection events.

 This method is called when:
   1. A new [Selectable] is added to the delegate, and its screen location
   falls into the previous selection.
   2. Before a [SelectionEvent] of type
   [SelectionEventType.startEdgeUpdate], [SelectionEventType.endEdgeUpdate],
   [SelectionEventType.granularlyExtendSelection], or
   [SelectionEventType.directionallyExtendSelection] is dispatched
   to a [Selectable] child.

## Return Type
`void`

## Parameters

- `selectable`: `Selectable`
