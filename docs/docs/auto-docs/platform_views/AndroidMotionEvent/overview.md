# Overview for `AndroidMotionEvent`

## Description

A Dart version of Android's [MotionEvent](https://developer.android.com/reference/android/view/MotionEvent).

 This is used by [AndroidViewController] to describe pointer events that are forwarded to a platform view
 when Flutter receives an event that it determines is to be handled by that platform view rather than by
 another Flutter widget.

 See also:

  * [AndroidViewController.sendMotionEvent], which can be used to send an [AndroidMotionEvent] explicitly.

## Members

- **downTime**: `int`
  The time (in ms) when the user originally pressed down to start a stream of position events,
 relative to an arbitrary timeline.

 See Android's [MotionEvent#getDownTime](https://developer.android.com/reference/android/view/MotionEvent.html#).

- **eventTime**: `int`
  The time this event occurred, relative to an arbitrary timeline.

 See Android's [MotionEvent#getEventTime](https://developer.android.com/reference/android/view/MotionEvent.html#).

- **action**: `int`
  A value representing the kind of action being performed.

 See Android's [MotionEvent#getAction](https://developer.android.com/reference/android/view/MotionEvent.html#).

- **pointerCount**: `int`
  The number of pointers that are part of this event.
 This must be equivalent to the length of `pointerProperties` and `pointerCoords`.

 See Android's [MotionEvent#getPointerCount](https://developer.android.com/reference/android/view/MotionEvent.html#).

- **pointerProperties**: `List&lt;AndroidPointerProperties&gt;`
  List of [AndroidPointerProperties] for each pointer that is part of this event.

- **pointerCoords**: `List&lt;AndroidPointerCoords&gt;`
  List of [AndroidPointerCoords] for each pointer that is part of this event.

- **metaState**: `int`
  The state of any meta / modifier keys that were in effect when the event was generated.

 See Android's [MotionEvent#getMetaState](https://developer.android.com/reference/android/view/MotionEvent.html#).

- **buttonState**: `int`
  The state of all buttons that are pressed such as a mouse or stylus button.

 See Android's [MotionEvent#getButtonState](https://developer.android.com/reference/android/view/MotionEvent.html#).

- **xPrecision**: `double`
  The precision of the X coordinates being reported, in physical pixels.

 See Android's [MotionEvent#getXPrecision](https://developer.android.com/reference/android/view/MotionEvent.html#).

- **yPrecision**: `double`
  The precision of the Y coordinates being reported, in physical pixels.

 See Android's [MotionEvent#getYPrecision](https://developer.android.com/reference/android/view/MotionEvent.html#).

- **deviceId**: `int`
  See Android's [MotionEvent#getDeviceId](https://developer.android.com/reference/android/view/MotionEvent.html#).

- **edgeFlags**: `int`
  A bit field indicating which edges, if any, were touched by this MotionEvent.

 See Android's [MotionEvent#getEdgeFlags](https://developer.android.com/reference/android/view/MotionEvent.html#).

- **source**: `int`
  The source of this event (e.g a touchpad or stylus).

 See Android's [MotionEvent#getSource](https://developer.android.com/reference/android/view/MotionEvent.html#).

- **flags**: `int`
  See Android's [MotionEvent#getFlags](https://developer.android.com/reference/android/view/MotionEvent.html#).

- **motionEventId**: `int`
  Used to identify this [MotionEvent](https://developer.android.com/reference/android/view/MotionEvent.html) uniquely in the Flutter Engine.

## Constructors

### Unnamed Constructor
Creates an AndroidMotionEvent.

