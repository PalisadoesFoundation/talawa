# Method: `didReceiveSelectionEventFor`

## Description

Tracks whether a selection edge update event for a given [Selectable] was received.

 When `forEnd` is true, the [Selectable] will be registered as having received
 an end event. When false, the [Selectable] is registered as having received
 a start event.

 When `forEnd` is null, the [Selectable] will be registered as having received both
 start and end events.

 Call this method when a [SelectionEvent] is dispatched to a child selectable managed
 by this delegate.

 Subclasses should call [clearInternalSelectionStateForSelectable] to clean up any state
 added by this method, for example when removing a [Selectable] from this delegate.

## Return Type
`void`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
