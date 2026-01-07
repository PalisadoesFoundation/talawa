# Overview for `GranularlyExtendSelectionEvent`

## Description

Extends the start or end of the selection by a given [TextGranularity].

 To handle this event, move the associated selection edge, as dictated by
 [isEnd], according to the [granularity].

## Dependencies

- SelectionEvent

## Members

- **forward**: `bool`
  Whether to extend the selection forward.

- **isEnd**: `bool`
  Whether this event is updating the end selection edge.

- **granularity**: `TextGranularity`
  The granularity for which the selection extend.

## Constructors

### Unnamed Constructor
Creates a [GranularlyExtendSelectionEvent].

