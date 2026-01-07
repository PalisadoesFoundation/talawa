# Overview for `RenderMouseRegion`

## Description

Calls callbacks in response to pointer events that are exclusive to mice.

 It responds to events that are related to hovering, i.e. when the mouse
 enters, exits (with or without pressing buttons), or moves over a region
 without pressing buttons.

 It does not respond to common events that construct gestures, such as when
 the pointer is pressed, moved, then released or canceled. For these events,
 use [RenderPointerListener].

 If it has a child, it defers to the child for sizing behavior.

 If it does not have a child, it grows to fit the parent-provided constraints.

 See also:

  * [MouseRegion], a widget that listens to hover events using
    [RenderMouseRegion].

## Dependencies

- RenderProxyBoxWithHitTestBehavior, MouseTrackerAnnotation

## Members

- **_opaque**: `bool`
- **onEnter**: `PointerEnterEventListener?`
- **onHover**: `PointerHoverEventListener?`
  Triggered when a pointer has moved onto or within the region without
 buttons pressed.

 This callback is not triggered by the movement of the object.

- **onExit**: `PointerExitEventListener?`
- **_cursor**: `MouseCursor`
- **_validForMouseTracker**: `bool`
## Constructors

### Unnamed Constructor
Creates a render object that forwards pointer events to callbacks.

 All parameters are optional. By default this method creates an opaque
 mouse region with no callbacks and cursor being [MouseCursor.defer].

