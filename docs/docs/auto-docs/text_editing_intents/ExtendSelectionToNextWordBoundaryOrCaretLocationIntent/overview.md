# Overview for `ExtendSelectionToNextWordBoundaryOrCaretLocationIntent`

## Description

Extends, or moves the current selection from the current
 [TextSelection.extent] position to the previous or the next word
 boundary, or the [TextSelection.base] position if it's closer in the move
 direction.

 This [Intent] typically has the same effect as an
 [ExtendSelectionToNextWordBoundaryIntent], except it collapses the selection
 when the order of [TextSelection.base] and [TextSelection.extent] would
 reverse.

 This is typically only used on MacOS.

## Dependencies

- DirectionalCaretMovementIntent

## Constructors

### Unnamed Constructor
Creates an [ExtendSelectionToNextWordBoundaryOrCaretLocationIntent].

