# Overview for `MouseTracker`

## Description

Tracks the relationship between mouse devices and annotations, and
 triggers mouse events and cursor changes accordingly.

 The [MouseTracker] tracks the relationship between mouse devices and
 [MouseTrackerAnnotation], notified by [updateWithEvent] and
 [updateAllDevices]. At every update, [MouseTracker] triggers the following
 changes if applicable:

  * Dispatches mouse-related pointer events (pointer enter, hover, and exit).
  * Changes mouse cursors.
  * Notifies when [mouseIsConnected] changes.

 This class is a [ChangeNotifier] that notifies its listeners if the value of
 [mouseIsConnected] changes.

 An instance of [MouseTracker] is owned by the global singleton
 [RendererBinding].

## Dependencies

- ChangeNotifier

## Members

- **_hitTestInView**: `MouseTrackerHitTest`
- **_mouseCursorMixin**: `MouseCursorManager`
- **_mouseStates**: `Map&lt;int, _MouseState&gt;`
- **_debugDuringDeviceUpdate**: `bool`
## Constructors

### Unnamed Constructor
Create a mouse tracker.

 The `hitTestInView` is used to find the render objects on a given
 position in the specific view. It is typically provided by the
 [RendererBinding].

