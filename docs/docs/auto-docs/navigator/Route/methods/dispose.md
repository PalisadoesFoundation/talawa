# Method: `dispose`

## Description

Discards any resources used by the object.

 This method should not remove its [overlayEntries] from the [Overlay]. The
 object's owner is in charge of doing that.

 After this is called, the object is not in a usable state and should be
 discarded.

 This method should only be called by the object's owner; typically the
 [Navigator] owns a route and so will call this method when the route is
 removed, after which the route is no longer referenced by the navigator.

## Return Type
`void`

