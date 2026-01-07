# Method: `canCut`

## Description

Whether the current selection of the text field managed by the given
 `delegate` can be removed from the text field and placed into the
 [Clipboard].

 By default, false is returned when nothing is selected in the text field.

 Subclasses can use this to decide if they should expose the cut
 functionality to the user.

## Return Type
`bool`

## Parameters

- `delegate`: `TextSelectionDelegate`
