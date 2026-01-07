# Overview for `MaterialPage`

## Description

A page that creates a material style [PageRoute].

 

 By default, when the created route is replaced by another, the previous
 route remains in memory. To free all the resources when this is not
 necessary, set [maintainState] to false.

 The `fullscreenDialog` property specifies whether the created route is a
 fullscreen modal dialog. On iOS, those routes animate from the bottom to the
 top rather than horizontally.

 The type `T` specifies the return type of the route which can be supplied as
 the route is popped from the stack via [Navigator.transitionDelegate] by
 providing the optional `result` argument to the
 [RouteTransitionRecord.markForPop] in the [TransitionDelegate.resolve].

 See also:

  * [MaterialPageRoute], which is the [PageRoute] version of this class

## Dependencies

- Page

## Members

- **child**: `Widget`
  The content to be shown in the [Route] created by this page.

- **maintainState**: `bool`
  

- **fullscreenDialog**: `bool`
  

- **allowSnapshotting**: `bool`
  

## Constructors

### Unnamed Constructor
Creates a material page.

