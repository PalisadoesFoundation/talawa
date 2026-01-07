# Overview for `ExpandSelectionToDocumentBoundaryIntent`

## Description

Expands the current selection to the document boundary in the direction
 given by [forward].

 Unlike [ExpandSelectionToLineBreakIntent], the extent will be moved, which
 matches the behavior on MacOS.

 See also:

   [ExtendSelectionToDocumentBoundaryIntent], which is similar but always
   moves the extent.

## Dependencies

- DirectionalCaretMovementIntent

## Constructors

### Unnamed Constructor
Creates an [ExpandSelectionToDocumentBoundaryIntent].

