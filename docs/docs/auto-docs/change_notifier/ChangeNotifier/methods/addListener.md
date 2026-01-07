# Method: `addListener`

## Description

Register a closure to be called when the object changes.

 If the given closure is already registered, an additional instance is
 added, and must be removed the same number of times it is added before it
 will stop being called.

 This method must not be called after [dispose] has been called.

 
 If a listener is added twice, and is removed once during an iteration
 (e.g. in response to a notification), it will still be called again. If,
 on the other hand, it is removed as many times as it was registered, then
 it will no longer be called. This odd behavior is the result of the
 [ChangeNotifier] not being able to determine which listener is being
 removed, since they are identical, therefore it will conservatively still
 call all the listeners when it knows that any are still registered.

 This surprising behavior can be unexpectedly observed when registering a
 listener on two separate objects which are both forwarding all
 registrations to a common upstream object.
 

 See also:

  * [removeListener], which removes a previously registered closure from
    the list of closures that are notified when the object changes.

## Return Type
`void`

## Parameters

- `listener`: `VoidCallback`
