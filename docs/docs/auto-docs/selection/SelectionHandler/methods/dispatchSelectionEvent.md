# Method: `dispatchSelectionEvent`

## Description

Handles the [SelectionEvent] sent to this object.

 The subclasses need to update their selections or delegate the
 [SelectionEvent]s to their subtrees.

 The `event`s are subclasses of [SelectionEvent]. Check
 [SelectionEvent.type] to determine what kinds of event are dispatched to
 this handler and handle them accordingly.

 See also:
  * [SelectionEventType], which contains all of the possible types.

## Return Type
`SelectionResult`

## Parameters

- `event`: `SelectionEvent`
