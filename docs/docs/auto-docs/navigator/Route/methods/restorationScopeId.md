# Method: `restorationScopeId`

## Description

The restoration scope ID to be used for the [RestorationScope] surrounding
 this route.

 The restoration scope ID is null if restoration is currently disabled
 for this route.

 If the restoration scope ID changes (e.g. because restoration is enabled
 or disabled) during the life of the route, the [ValueListenable] notifies
 its listeners. As an example, the ID changes to null while the route is
 transitioning off screen, which triggers a notification on this field. At
 that point, the route is considered as no longer present for restoration
 purposes and its state will not be restored.

## Return Type
`ValueListenable<String?>`

