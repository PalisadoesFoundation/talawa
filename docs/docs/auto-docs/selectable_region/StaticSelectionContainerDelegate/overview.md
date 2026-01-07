# Overview for `StaticSelectionContainerDelegate`

## Description

A delegate that manages updating multiple [Selectable] children where the
 [Selectable]s do not change or move around frequently.

 This delegate keeps track of the [Selectable]s that received start or end
 [SelectionEvent]s and the global locations of those events to accurately
 synthesize [SelectionEvent]s for children [Selectable]s when needed.

 When a new [SelectionEdgeUpdateEvent] is dispatched to a [Selectable], this
 delegate checks whether the [Selectable] has already received a selection
 update for each edge that currently exists, and synthesizes an event for the
 edges that have not yet received an update. This synthesized event is dispatched
 before dispatching the new event.

 For example, if we have an existing start edge for this delegate and a [Selectable]
 child receives an end [SelectionEdgeUpdateEvent] and the child hasn't received a start
 [SelectionEdgeUpdateEvent], we synthesize a start [SelectionEdgeUpdateEvent] for the
 child [Selectable] and dispatch it before dispatching the original end [SelectionEdgeUpdateEvent].

 See also:

  * [MultiSelectableSelectionContainerDelegate], for the class that provides
  the main implementation details of this [SelectionContainerDelegate].

## Dependencies

- MultiSelectableSelectionContainerDelegate

## Members

- **_hasReceivedStartEvent**: `Set&lt;Selectable&gt;`
  The set of [Selectable]s that have received start events.

- **_hasReceivedEndEvent**: `Set&lt;Selectable&gt;`
  The set of [Selectable]s that have received end events.

- **_lastStartEdgeUpdateGlobalPosition**: `Offset?`
  The global position of the last selection start edge update.

- **_lastEndEdgeUpdateGlobalPosition**: `Offset?`
  The global position of the last selection end edge update.

