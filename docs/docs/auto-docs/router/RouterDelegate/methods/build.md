# Method: `build`

## Description

Called by the [Router] to obtain the widget tree that represents the
 current state.

 This is called whenever the [Future]s returned by [setInitialRoutePath],
 [setNewRoutePath], or [setRestoredRoutePath] complete as well as when this
 notifies its clients (see the [Listenable] interface, which this interface
 includes). In addition, it may be called at other times. It is important,
 therefore, that the methods above do not update the state that the [build]
 method uses before they complete their respective futures.

 Typically this method returns a suitably-configured [Navigator]. If you do
 plan to create a navigator, consider using the
 [PopNavigatorRouterDelegateMixin]. If state restoration is enabled for the
 [Router] using this delegate, consider providing a non-null
 [Navigator.restorationScopeId] to the [Navigator] returned by this method.

 This method must not return null.

 The `context` is the [Router]'s build context.

## Return Type
`Widget`

## Parameters

- `context`: `BuildContext`
