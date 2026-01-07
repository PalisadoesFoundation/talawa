# Overview for `ExtendSelectionToNextParagraphBoundaryOrCaretLocationIntent`

## Description

Extends, or moves the current selection from the current
 [TextSelection.extent] position to the previous or the next paragraph
 boundary depending on the [forward] parameter.

 This [Intent] typically has the same effect as an
 [ExtendSelectionToNextParagraphBoundaryIntent], except it collapses the selection
 when the order of [TextSelection.base] and [TextSelection.extent] would
 reverse.

 This is typically only used on MacOS.

## Dependencies

- DirectionalCaretMovementIntent

## Constructors

### Unnamed Constructor
Creates an [ExtendSelectionToNextParagraphBoundaryOrCaretLocationIntent].

