# Method: `hasListeners`

## Description

Whether any listeners are currently registered.

 Clients should not depend on this value for their behavior, because having
 one listener's logic change when another listener happens to start or stop
 listening will lead to extremely hard-to-track bugs. Subclasses might use
 this information to determine whether to do any work when there are no
 listeners, however; for example, [MultiFrameImageStreamCompleter] uses it
 to determine when to iterate through frames of an animated image.

 Typically this is used by overriding [addListener], checking if
 [hasListeners] is false before calling `super.`, and if so,
 starting whatever work is needed to determine when to notify listeners;
 and similarly, by overriding [removeListener], checking if [hasListeners]
 is false after calling `super.`, and if so, stopping that
 same work.

 The ephemeral error listeners (added through [addEphemeralErrorListener])
 will not be taken into consideration in this property.

## Return Type
`bool`

