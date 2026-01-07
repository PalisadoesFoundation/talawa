# Method: `takePriority`

## Description

Make this [BackButtonDispatcher] take priority among its peers.

 This has no effect when a [BackButtonDispatcher] has no parents and no
 children. If a [BackButtonDispatcher] does have parents or children,
 however, it causes this object to be the one to dispatch the notification
 when the parent would normally notify its callback.

 The [BackButtonDispatcher] must have a listener registered before it can
 be told to take priority.

## Return Type
`void`

