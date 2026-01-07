# Overview for `PlatformRouteInformationProvider`

## Description

The route information provider that propagates the platform route information changes.

 This provider also reports the new route information from the [Router] widget
 back to engine using message channel method, the
 [SystemNavigator.routeInformationUpdated].

 Each time [SystemNavigator.routeInformationUpdated] is called, the
 [SystemNavigator.selectMultiEntryHistory] method is also called. This
 overrides the initialization behavior of
 [Navigator.reportsRouteUpdateToEngine].

## Dependencies

- RouteInformationProvider, WidgetsBindingObserver, ChangeNotifier

## Members

- **_value**: `RouteInformation`
- **_valueInEngine**: `RouteInformation`
## Constructors

### Unnamed Constructor
Create a platform route information provider.

 Use the [initialRouteInformation] to set the default route information for this
 provider.

