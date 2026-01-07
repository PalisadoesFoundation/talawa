# Method: `parseRouteInformation`

## Description


 Converts the given route information into parsed data to pass to a
 [RouterDelegate].

 The method should return a future which completes when the parsing is
 complete. The parsing may be asynchronous if, e.g., the parser needs to
 communicate with the OEM thread to obtain additional data about the route.

 Consider using a [SynchronousFuture] if the result can be computed
 synchronously, so that the [Router] does not need to wait for the next
 microtask to pass the data to the [RouterDelegate].
 

 One can implement [parseRouteInformationWithDependencies] instead if
 the parsing depends on other dependencies from the [BuildContext].

## Return Type
`Future&lt;T&gt;`

## Parameters

- `routeInformation`: `RouteInformation`
