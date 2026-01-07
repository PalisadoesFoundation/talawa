# Method: `hasListeners`

## Description

Whether any listeners are currently registered.

 Clients should not depend on this value for their behavior, because having
 one listener's logic change when another listener happens to start or stop
 listening will lead to extremely hard-to-track bugs. Subclasses might use
 this information to determine whether to do any work when there are no
 listeners, however; for example, resuming a [Stream] when a listener is
 added and pausing it when a listener is removed.

 Typically this is used by overriding [addListener], checking if
 [hasListeners] is false before calling `super.`, and if so,
 starting whatever work is needed to determine when to call
 [notifyListeners]; and similarly, by overriding [removeListener], checking
 if [hasListeners] is false after calling `super.`, and if
 so, stopping that same work.

 This method returns false if [dispose] has been called.

## Return Type
`bool`

