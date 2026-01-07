# Overview for `RouteInformation`

## Description

A piece of routing information.

 The route information consists of a location string of the application and
 a state object that configures the application in that location.

 This information flows two ways, from the [RouteInformationProvider] to the
 [Router] or from the [Router] to [RouteInformationProvider].

 In the former case, the [RouteInformationProvider] notifies the [Router]
 widget when a new [RouteInformation] is available. The [Router] widget takes
 these information and navigates accordingly.

 The latter case happens in web application where the [Router] reports route
 changes back to the web engine.

 The current [RouteInformation] of an application is also used for state
 restoration purposes. Before an application is killed, the [Router] converts
 its current configurations into a [RouteInformation] object utilizing the
 [RouteInformationProvider]. The [RouteInformation] object is then serialized
 out and persisted. During state restoration, the object is deserialized and
 passed back to the [RouteInformationProvider], which turns it into a
 configuration for the [Router] again to restore its state from.

## Members

- **_location**: `String?`
- **_uri**: `Uri?`
- **state**: `Object?`
  The state of the application in the [uri].

 The app can have different states even in the same location. For example,
 the text inside a [TextField] or the scroll position in a [ScrollView].
 These widget states can be stored in the [state].

 On the web, this information is stored in the browser history when the
 [Router] reports this route information back to the web engine
 through the [PlatformRouteInformationProvider]. The information
 is then passed back, along with the [uri], when the user
 clicks the back or forward buttons.

 This information is also serialized and persisted alongside the
 [uri] for state restoration purposes. During state restoration,
 the information is made available again to the [Router] so it can restore
 its configuration to the previous state.

 The state must be serializable.

## Constructors

### Unnamed Constructor
Creates a route information object.

 Either `location` or `uri` must not be null.

