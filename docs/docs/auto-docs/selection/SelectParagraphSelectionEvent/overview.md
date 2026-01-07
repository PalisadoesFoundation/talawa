# Overview for `SelectParagraphSelectionEvent`

## Description

Selects the entire paragraph at the location.

 This event can be sent as the result of a triple click to select.

## Dependencies

- SelectionEvent

## Members

- **globalPosition**: `Offset`
  The position in global coordinates to select paragraph at.

- **absorb**: `bool`
  Whether the selectable receiving the event should be absorbed into
 an encompassing paragraph.

## Constructors

### Unnamed Constructor
Creates a select paragraph event at the [globalPosition].

