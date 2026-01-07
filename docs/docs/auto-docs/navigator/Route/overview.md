# Overview for `Route`

## Description

An abstraction for an entry managed by a [Navigator].

 This class defines an abstract interface between the navigator and the
 "routes" that are pushed on and popped off the navigator. Most routes have
 visual affordances, which they place in the navigators [Overlay] using one
 or more [OverlayEntry] objects.

 See [Navigator] for more explanation of how to use a [Route] with
 navigation, including code examples.

 See [MaterialPageRoute] for a route that replaces the entire screen with a
 platform-adaptive transition.

 A route can belong to a page if the [settings] are a subclass of [Page]. A
 page-based route, as opposed to a pageless route, is created from
 [Page.createRoute] during [Navigator.pages] updates. The page associated
 with this route may change during the lifetime of the route. If the
 [Navigator] updates the page of this route, it calls [changedInternalState]
 to notify the route that the page has been updated.

 The type argument `T` is the route's return type, as used by
 [currentResult], [popped], and [didPop]. The type `void` may be used if the
 route does not return a value.

## Dependencies

- _RoutePlaceholder

## Members

- **_requestFocus**: `bool?`
- **_navigator**: `NavigatorState?`
- **_settings**: `RouteSettings`
- **_restorationScopeId**: `ValueNotifier<String?>`
- **_popCompleter**: `Completer<T?>`
- **_disposeCompleter**: `Completer<T?>`
## Constructors

### Unnamed Constructor
Initialize the [Route].

 If the [settings] are not provided, an empty [RouteSettings] object is
 used instead.

 
 If [requestFocus] is not provided, the value of [Navigator.requestFocus] is
 used instead.
 

