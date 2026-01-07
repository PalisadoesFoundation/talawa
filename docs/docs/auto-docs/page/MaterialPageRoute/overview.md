# Overview for `MaterialPageRoute`

## Description

A modal route that replaces the entire screen with a platform-adaptive
 transition.

 

 By default, when a modal route is replaced by another, the previous route
 remains in memory. To free all the resources when this is not necessary, set
 [maintainState] to false.

 The `fullscreenDialog` property specifies whether the incoming route is a
 fullscreen modal dialog. On iOS, those routes animate from the bottom to the
 top rather than horizontally.

 If `barrierDismissible` is true, then pressing the escape key on the keyboard
 will cause the current route to be popped with null as the value.

 The type `T` specifies the return type of the route which can be supplied as
 the route is popped from the stack via [Navigator.pop] by providing the
 optional `result` argument.

 See also:

  * [MaterialRouteTransitionMixin], which provides the material transition
    for this route.
  * [MaterialPage], which is a [Page] of this class.

## Dependencies

- PageRoute, MaterialRouteTransitionMixin

## Members

- **builder**: `WidgetBuilder`
  Builds the primary contents of the route.

- **maintainState**: `bool`
## Constructors

### Unnamed Constructor
Construct a MaterialPageRoute whose contents are defined by [builder].

