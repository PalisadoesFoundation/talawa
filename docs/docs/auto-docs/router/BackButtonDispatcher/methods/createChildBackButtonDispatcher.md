# Method: `createChildBackButtonDispatcher`

## Description

Creates a [ChildBackButtonDispatcher] that is a direct descendant of this
 back button dispatcher.

 To participate in handling the pop route request, call the [takePriority]
 on the [ChildBackButtonDispatcher] created from this method.

 When the pop route request is handled by this back button dispatcher, it
 propagate the request to its direct descendants that have called the
 [takePriority] method. If there are multiple candidates, the latest one
 that called the [takePriority] wins the right to handle the request. If
 the latest one does not handle the request (by returning a future of
 false in [ChildBackButtonDispatcher.notifiedByParent]), the second latest
 one will then have the right to handle the request. This dispatcher
 continues finding the next candidate until there are no more candidates
 and finally handles the request itself.

## Return Type
`ChildBackButtonDispatcher`

