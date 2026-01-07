# Method: `didReceiveSelectionBoundaryEvents`

## Description

Updates the internal selection state after a [SelectionEvent] that
 selects a boundary such as: [SelectWordSelectionEvent],
 [SelectParagraphSelectionEvent], and [SelectAllSelectionEvent].

 Call this method after determining the new selection as a result of
 a [SelectionEvent] that selects a boundary. The [currentSelectionStartIndex]
 and [currentSelectionEndIndex] should be set to valid values at the time
 this method is called.

 Subclasses should call [clearInternalSelectionStateForSelectable] to clean up any state
 added by this method, for example when removing a [Selectable] from this delegate.

## Return Type
`void`

