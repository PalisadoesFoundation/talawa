# Method: `currentConfiguration`

## Description

Called by the [Router] when it detects a route information may have
 changed as a result of rebuild.

 If this getter returns non-null, the [Router] will start to report new
 route information back to the engine. In web applications, the new
 route information is used for populating browser history in order to
 support the forward and the backward buttons.

 When overriding this method, the configuration returned by this getter
 must be able to construct the current app state and build the widget
 with the same configuration in the [build] method if it is passed back
 to the [setNewRoutePath]. Otherwise, the browser backward and forward
 buttons will not work properly.

 By default, this getter returns null, which prevents the [Router] from
 reporting the route information. To opt in, a subclass can override this
 getter to return the current configuration.

 At most one [Router] can opt in to route information reporting. Typically,
 only the top-most [Router] created by [WidgetsApp.router] should opt for
 route information reporting.

 ## State Restoration

 This getter is also used by the [Router] to implement state restoration.
 During state serialization, the [Router] will persist the current
 configuration and during state restoration pass it back to the delegate
 by calling [setRestoredRoutePath].

## Return Type
`T?`

