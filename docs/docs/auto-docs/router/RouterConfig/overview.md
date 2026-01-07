# Overview for `RouterConfig`

## Description

A convenient bundle to configure a [Router] widget.

 To configure a [Router] widget, one needs to provide several delegates,
 [RouteInformationProvider], [RouteInformationParser], [RouterDelegate],
 and [BackButtonDispatcher]. This abstract class provides way to bundle these
 delegates into a single object to configure a [Router].

 The [backButtonDispatcher], [routeInformationProvider], and
 [routeInformationProvider] are optional.

 The [routeInformationProvider] and [routeInformationParser] must
 both be provided or both not provided.

## Members

- **routeInformationProvider**: `RouteInformationProvider?`
  The [RouteInformationProvider] that is used to configure the [Router].

- **routeInformationParser**: `RouteInformationParser&lt;T&gt;?`
  The [RouteInformationParser] that is used to configure the [Router].

- **routerDelegate**: `RouterDelegate&lt;T&gt;`
  The [RouterDelegate] that is used to configure the [Router].

- **backButtonDispatcher**: `BackButtonDispatcher?`
  The [BackButtonDispatcher] that is used to configure the [Router].

## Constructors

### Unnamed Constructor
Creates a [RouterConfig].

 The [backButtonDispatcher], [routeInformationProvider], and
 [routeInformationParser] are optional.

 The [routeInformationProvider] and [routeInformationParser] must both be
 provided or both not provided.

