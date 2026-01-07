# Overview for `PointerData`

## Description

Information about the state of a pointer.

## Members

- **viewId**: `int`
  The ID of the [FlutterView] this [PointerEvent] originated from.

- **embedderId**: `int`
  Unique identifier that ties the [PointerEvent] to the embedder
 event that created it.
 it.

 No two pointer events can have the same [embedderId]. This is different
 from [pointerIdentifier] - used for hit-testing, whereas [embedderId] is
 used to identify the platform event.

- **timeStamp**: `Duration`
  Time of event dispatch, relative to an arbitrary timeline.

- **change**: `PointerChange`
  How the pointer has changed since the last report.

- **kind**: `PointerDeviceKind`
  The kind of input device for which the event was generated.

- **signalKind**: `PointerSignalKind?`
  The kind of signal for a pointer signal event.

- **device**: `int`
  Unique identifier for the pointing device, reused across interactions.

- **pointerIdentifier**: `int`
  Unique identifier for the pointer.

 This field changes for each new pointer down event. Framework uses this
 identifier to determine hit test result.

- **physicalX**: `double`
  X coordinate of the position of the pointer, in physical pixels in the
 global coordinate space.

- **physicalY**: `double`
  Y coordinate of the position of the pointer, in physical pixels in the
 global coordinate space.

- **physicalDeltaX**: `double`
  The distance of pointer movement on X coordinate in physical pixels.

- **physicalDeltaY**: `double`
  The distance of pointer movement on Y coordinate in physical pixels.

- **buttons**: `int`
  Bit field using the *Button constants (primaryMouseButton,
 secondaryStylusButton, etc). For example, if this has the value 6 and the
 [kind] is [PointerDeviceKind.invertedStylus], then this indicates an
 upside-down stylus with both its primary and secondary buttons pressed.

- **obscured**: `bool`
  Set if an application from a different security domain is in any way
 obscuring this application's window. (Aspirational; not currently
 implemented.)

- **synthesized**: `bool`
  Set if this pointer data was synthesized by pointer data packet converter.
 pointer data packet converter will synthesize additional pointer datas if
 the input sequence of pointer data is illegal.

 For example, a down pointer data will be synthesized if the converter receives
 a move pointer data while the pointer is not previously down.

- **pressure**: `double`
  The pressure of the touch as a number ranging from 0.0, indicating a touch
 with no discernible pressure, to 1.0, indicating a touch with "normal"
 pressure, and possibly beyond, indicating a stronger touch. For devices
 that do not detect pressure (e.g. mice), returns 1.0.

- **pressureMin**: `double`
  The minimum value that [pressure] can return for this pointer. For devices
 that do not detect pressure (e.g. mice), returns 1.0. This will always be
 a number less than or equal to 1.0.

- **pressureMax**: `double`
  The maximum value that [pressure] can return for this pointer. For devices
 that do not detect pressure (e.g. mice), returns 1.0. This will always be
 a greater than or equal to 1.0.

- **distance**: `double`
  The distance of the detected object from the input surface (e.g. the
 distance of a stylus or finger from a touch screen), in arbitrary units on
 an arbitrary (not necessarily linear) scale. If the pointer is down, this
 is 0.0 by definition.

- **distanceMax**: `double`
  The maximum value that a distance can return for this pointer. If this
 input device cannot detect "hover touch" input events, then this will be
 0.0.

- **size**: `double`
  The area of the screen being pressed, scaled to a value between 0 and 1.
 The value of size can be used to determine fat touch events. This value
 is only set on Android, and is a device specific approximation within
 the range of detectable values. So, for example, the value of 0.1 could
 mean a touch with the tip of the finger, 0.2 a touch with full finger,
 and 0.3 the full palm.

- **radiusMajor**: `double`
  The radius of the contact ellipse along the major axis, in logical pixels.

- **radiusMinor**: `double`
  The radius of the contact ellipse along the minor axis, in logical pixels.

- **radiusMin**: `double`
  The minimum value that could be reported for radiusMajor and radiusMinor
 for this pointer, in logical pixels.

- **radiusMax**: `double`
  The minimum value that could be reported for radiusMajor and radiusMinor
 for this pointer, in logical pixels.

- **orientation**: `double`
  For PointerDeviceKind.touch events:

 The angle of the contact ellipse, in radius in the range:

    -pi/2 < orientation <= pi/2

 ...giving the angle of the major axis of the ellipse with the y-axis
 (negative angles indicating an orientation along the top-left /
 bottom-right diagonal, positive angles indicating an orientation along the
 top-right / bottom-left diagonal, and zero indicating an orientation
 parallel with the y-axis).

 For PointerDeviceKind.stylus and PointerDeviceKind.invertedStylus events:

 The angle of the stylus, in radians in the range:

    -pi < orientation <= pi

 ...giving the angle of the axis of the stylus projected onto the input
 surface, relative to the positive y-axis of that surface (thus 0.0
 indicates the stylus, if projected onto that surface, would go from the
 contact point vertically up in the positive y-axis direction, pi would
 indicate that the stylus would go down in the negative y-axis direction;
 pi/4 would indicate that the stylus goes up and to the right, -pi/2 would
 indicate that the stylus goes to the left, etc).

- **tilt**: `double`
  For PointerDeviceKind.stylus and PointerDeviceKind.invertedStylus events:

 The angle of the stylus, in radians in the range:

    0 <= tilt <= pi/2

 ...giving the angle of the axis of the stylus, relative to the axis
 perpendicular to the input surface (thus 0.0 indicates the stylus is
 orthogonal to the plane of the input surface, while pi/2 indicates that
 the stylus is flat on that surface).

- **platformData**: `int`
  Opaque platform-specific data associated with the event.

- **scrollDeltaX**: `double`
  For events with signalKind of PointerSignalKind.scroll:

 The amount to scroll in the x direction, in physical pixels.

- **scrollDeltaY**: `double`
  For events with signalKind of PointerSignalKind.scroll:

 The amount to scroll in the y direction, in physical pixels.

- **panX**: `double`
  For events with change of PointerChange.panZoomUpdate:

 The current panning magnitude of the pan/zoom in the x direction, in
 physical pixels.

- **panY**: `double`
  For events with change of PointerChange.panZoomUpdate:

 The current panning magnitude of the pan/zoom in the y direction, in
 physical pixels.

- **panDeltaX**: `double`
  For events with change of PointerChange.panZoomUpdate:

 The difference in panning of the pan/zoom in the x direction since the
 latest panZoomUpdate event, in physical pixels.

- **panDeltaY**: `double`
  For events with change of PointerChange.panZoomUpdate:

 The difference in panning of the pan/zoom in the y direction since the
 last panZoomUpdate event, in physical pixels.

- **scale**: `double`
  For events with change of PointerChange.panZoomUpdate:

 The current scale of the pan/zoom (unitless), with 1.0 as the initial scale.

- **rotation**: `double`
  For events with change of PointerChange.panZoomUpdate:

 The current angle of the pan/zoom in radians, with 0.0 as the initial angle.

- **_onRespond**: `PointerDataRespondCallback?`
## Constructors

### Unnamed Constructor
Creates an object that represents the state of a pointer.

