# Overview for `RouterDelegate`

## Description

A delegate that is used by the [Router] widget to build and configure a
 navigating widget.

 This delegate is the core piece of the [Router] widget. It responds to
 push route and pop route intents from the engine and notifies the [Router]
 to rebuild. It also acts as a builder for the [Router] widget and builds a
 navigating widget, typically a [Navigator], when the [Router] widget
 builds.

 When the engine pushes a new route, the route information is parsed by the
 [RouteInformationParser] to produce a configuration of type T. The router
 delegate receives the configuration through [setInitialRoutePath] or
 [setNewRoutePath] to configure itself and builds the latest navigating
 widget when asked ([build]).

 When implementing subclasses, consider defining a [Listenable] app state object to be
 used for building the navigating widget. The router delegate would update
 the app state accordingly and notify its own listeners when the app state has
 changed and when it receive route related engine intents (e.g.
 [setNewRoutePath], [setInitialRoutePath], or [popRoute]).

 All subclass must implement [setNewRoutePath], [popRoute], and [build].

 ## State Restoration

 If the [Router] owning this delegate is configured for state restoration, it
 will persist and restore the configuration of this [RouterDelegate] using
 the following mechanism: Before the app is killed by the operating system,
 the value of [currentConfiguration] is serialized out and persisted. After
 the app has restarted, the value is deserialized and passed back to the
 [RouterDelegate] via a call to [setRestoredRoutePath] (which by default just
 calls [setNewRoutePath]). It is the responsibility of the [RouterDelegate]
 to use the configuration information provided to restore its internal state.

 See also:

  * [RouteInformationParser], which is responsible for parsing the route
    information to a configuration before passing in to router delegate.
  * [Router], which is the widget that wires all the delegates together to
    provide a fully functional routing solution.

## Dependencies

- Listenable

