# Overview for `ExpandSelectionToLineBreakIntent`

## Description

Expands the current selection to the closest line break in the direction
 given by [forward].

 Either the base or extent can move, whichever is closer to the line break.
 The selection will never shrink.

 This behavior is common on MacOS.

 See also:

   [ExtendSelectionToLineBreakIntent], which is similar but always moves the
   extent.

## Dependencies

- DirectionalCaretMovementIntent

## Constructors

### Unnamed Constructor
Creates an [ExpandSelectionToLineBreakIntent].

