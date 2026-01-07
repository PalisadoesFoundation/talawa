# Method: `parseRouteInformationWithDependencies`

## Description



 The input [BuildContext] can be used for looking up [InheritedWidget]s
 If one uses [BuildContext.dependOnInheritedWidgetOfExactType], a
 dependency will be created. The [Router] will re-parse the
 [RouteInformation] from its [RouteInformationProvider] if the dependency
 notifies its listeners.

 One can also use [BuildContext.getElementForInheritedWidgetOfExactType] to
 look up [InheritedWidget]s without creating dependencies.

## Return Type
`Future&lt;T&gt;`

## Parameters

- `routeInformation`: `RouteInformation`
- `context`: `BuildContext`
