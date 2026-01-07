# Method: `deferTo`

## Description

Mark the given child as taking priority over this object and the other
 children.

 This causes [invokeCallback] to defer to the given child instead of
 calling this object's callback.

 Children are stored in a list, so that if the current child is removed
 using [forget], a previous child will return to take its place. When
 [takePriority] is called, the list is cleared.

 Calling this again without first calling [forget] moves the child back to
 the head of the list.

 The [BackButtonDispatcher] must have a listener registered before it can
 be told to defer to a child.

## Return Type
`void`

## Parameters

- `child`: `ChildBackButtonDispatcher`
