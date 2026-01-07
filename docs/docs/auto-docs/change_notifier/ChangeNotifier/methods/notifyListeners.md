# Method: `notifyListeners`

## Description

Call all the registered listeners.

 Call this method whenever the object changes, to notify any clients the
 object may have changed. Listeners that are added during this iteration
 will not be visited. Listeners that are removed during this iteration will
 not be visited after they are removed.

 Exceptions thrown by listeners will be caught and reported using
 [FlutterError.reportError].

 This method must not be called after [dispose] has been called.

 Surprising behavior can result when reentrantly removing a listener (e.g.
 in response to a notification) that has been registered multiple times.
 See the discussion at [removeListener].

## Return Type
`void`

