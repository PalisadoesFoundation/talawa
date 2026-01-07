# Overview for `RouteInformationProvider`

## Description

A route information provider that provides route information for the
 [Router] widget

 This provider is responsible for handing the route information through [value]
 getter and notifies listeners, typically the [Router] widget, when a new
 route information is available.

 When the router opts for route information reporting (by overriding the
 [RouterDelegate.currentConfiguration] to return non-null), override the
 [routerReportsNewRouteInformation] method to process the route information.

 See also:

  * [PlatformRouteInformationProvider], which wires up the itself with the
    [WidgetsBindingObserver.didPushRoute] to propagate platform push route
    intent to the [Router] widget, as well as reports new route information
    from the [Router] back to the engine by overriding the
    [routerReportsNewRouteInformation].

## Dependencies

- ValueListenable

