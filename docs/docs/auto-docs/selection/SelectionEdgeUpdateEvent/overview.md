# Overview for `SelectionEdgeUpdateEvent`

## Description

Updates a selection edge.

 An active selection contains two edges, start and end. Use the [type] to
 determine which edge this event applies to. If the [type] is
 [SelectionEventType.startEdgeUpdate], the event updates start edge. If the
 [type] is [SelectionEventType.endEdgeUpdate], the event updates end edge.

 The [globalPosition] contains the new offset of the edge.

 The [granularity] contains the granularity that the selection edge should move by.
 Only [TextGranularity.character] and [TextGranularity.word] are currently supported.

 This event is dispatched when the framework detects [TapDragStartDetails] in
 [SelectionArea]'s gesture recognizers for mouse devices, or the selection
 handles have been dragged to new locations.

## Dependencies

- SelectionEvent

## Members

- **globalPosition**: `Offset`
  The new location of the selection edge.

- **granularity**: `TextGranularity`
  The granularity for which the selection moves.

 Only [TextGranularity.character] and [TextGranularity.word] are currently supported.

 Defaults to [TextGranularity.character].

## Constructors

### forStart
Creates a selection start edge update event.

 The [globalPosition] contains the location of the selection start edge.

 The [granularity] contains the granularity which the selection edge should move by.
 This value defaults to [TextGranularity.character].

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
### forEnd
Creates a selection end edge update event.

 The [globalPosition] contains the new location of the selection end edge.

 The [granularity] contains the granularity which the selection edge should move by.
 This value defaults to [TextGranularity.character].

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
