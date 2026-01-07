# Overview for `RouteInformationParser`

## Description

A delegate that is used by the [Router] widget to parse a route information
 into a configuration of type T.

 This delegate is used when the [Router] widget is first built with initial
 route information from [Router.routeInformationProvider] and any subsequent
 new route notifications from it. The [Router] widget calls the [parseRouteInformation]
 with the route information from [Router.routeInformationProvider].

 One of the [parseRouteInformation] or
 [parseRouteInformationWithDependencies] must be implemented, otherwise a
 runtime error will be thrown.

## Constructors

### Unnamed Constructor
Abstract const constructor. This constructor enables subclasses to provide
 const constructors so that they can be used in const expressions.

