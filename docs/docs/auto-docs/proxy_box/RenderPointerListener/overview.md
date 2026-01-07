# Overview for `RenderPointerListener`

## Description

Calls callbacks in response to common pointer events.

 It responds to events that can construct gestures, such as when the
 pointer is pointer is pressed and moved, and then released or canceled.

 It does not respond to events that are exclusive to mouse, such as when the
 mouse enters and exits a region without pressing any buttons. For
 these events, use [RenderMouseRegion].

 If it has a child, defers to the child for sizing behavior.

 If it does not have a child, grows to fit the parent-provided constraints.

## Dependencies

- RenderProxyBoxWithHitTestBehavior

## Members

- **onPointerDown**: `PointerDownEventListener?`
  Called when a pointer comes into contact with the screen (for touch
 pointers), or has its button pressed (for mouse pointers) at this widget's
 location.

- **onPointerMove**: `PointerMoveEventListener?`
  Called when a pointer that triggered an [onPointerDown] changes position.

- **onPointerUp**: `PointerUpEventListener?`
  Called when a pointer that triggered an [onPointerDown] is no longer in
 contact with the screen.

- **onPointerHover**: `PointerHoverEventListener?`
  Called when a pointer that has not an [onPointerDown] changes position.

- **onPointerCancel**: `PointerCancelEventListener?`
  Called when the input from a pointer that triggered an [onPointerDown] is
 no longer directed towards this receiver.

- **onPointerPanZoomStart**: `PointerPanZoomStartEventListener?`
  Called when a pan/zoom begins such as from a trackpad gesture.

- **onPointerPanZoomUpdate**: `PointerPanZoomUpdateEventListener?`
  Called when a pan/zoom is updated.

- **onPointerPanZoomEnd**: `PointerPanZoomEndEventListener?`
  Called when a pan/zoom finishes.

- **onPointerSignal**: `PointerSignalEventListener?`
  Called when a pointer signal occurs over this object.

## Constructors

### Unnamed Constructor
Creates a render object that forwards pointer events to callbacks.

 The [behavior] argument defaults to [HitTestBehavior.deferToChild].

