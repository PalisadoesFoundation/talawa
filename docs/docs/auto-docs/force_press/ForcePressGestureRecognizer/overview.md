# Overview for `ForcePressGestureRecognizer`

## Description

Recognizes a force press on devices that have force sensors.

 Only the force from a single pointer is used to invoke events. A tap
 recognizer will win against this recognizer on pointer up as long as the
 pointer has not pressed with a force greater than
 [ForcePressGestureRecognizer.startPressure]. A long press recognizer will
 win when the press down time exceeds the threshold time as long as the
 pointer's pressure was never greater than
 [ForcePressGestureRecognizer.startPressure] in that duration.

 As of November, 2018 iPhone devices of generation 6S and higher have
 force touch functionality, with the exception of the iPhone XR. In addition,
 a small handful of Android devices have this functionality as well.

 Devices with faux screen pressure sensors like the Pixel 2 and 3 will not
 send any force press related callbacks.

 Reported pressure will always be in the range 0.0 to 1.0, where 1.0 is
 maximum pressure and 0.0 is minimum pressure. If using a custom
 [interpolation] callback, the pressure reported will correspond to that
 custom curve.

## Dependencies

- OneSequenceGestureRecognizer

## Members

- **onStart**: `GestureForcePressStartCallback?`
  A pointer is in contact with the screen and has just pressed with a force
 exceeding the [startPressure]. Consequently, if there were other gesture
 detectors, only the force press gesture will be detected and all others
 will be rejected.

 The position of the pointer is provided in the callback's `details`
 argument, which is a [ForcePressDetails] object.

- **onUpdate**: `GestureForcePressUpdateCallback?`
  A pointer is in contact with the screen and is either moving on the plane
 of the screen, pressing the screen with varying forces or both
 simultaneously.

 This callback will be invoked for every pointer event after the invocation
 of [onStart] and/or [onPeak] and before the invocation of [onEnd], no
 matter what the pressure is during this time period. The position and
 pressure of the pointer is provided in the callback's `details` argument,
 which is a [ForcePressDetails] object.

- **onPeak**: `GestureForcePressPeakCallback?`
  A pointer is in contact with the screen and has just pressed with a force
 exceeding the [peakPressure]. This is an arbitrary second level action
 threshold and isn't necessarily the maximum possible device pressure
 (which is 1.0).

 The position of the pointer is provided in the callback's `details`
 argument, which is a [ForcePressDetails] object.

- **onEnd**: `GestureForcePressEndCallback?`
  A pointer is no longer in contact with the screen.

 The position of the pointer is provided in the callback's `details`
 argument, which is a [ForcePressDetails] object.

- **startPressure**: `double`
  The pressure of the press required to initiate a force press.

 A value of 0.0 is no pressure, and 1.0 is maximum pressure.

- **peakPressure**: `double`
  The pressure of the press required to peak a force press.

 A value of 0.0 is no pressure, and 1.0 is maximum pressure. This value
 must be greater than [startPressure].

- **interpolation**: `GestureForceInterpolation`
  The function used to convert the raw device pressure values into a value
 in the range 0.0 to 1.0.

 The function takes in the device's minimum, maximum and raw touch pressure
 and returns a value in the range 0.0 to 1.0 denoting the interpolated
 touch pressure.

 This function must always return values in the range 0.0 to 1.0 given a
 pressure that is between the minimum and maximum pressures. It may return
 `double.NaN` for values that it does not want to support.

 By default, the function is a linear interpolation; however, changing the
 function could be useful to accommodate variations in the way different
 devices respond to pressure, or to change how animations from pressure
 feedback are rendered.

 For example, an ease-in curve can be used to determine the interpolated
 value:

 ```dart
 double interpolateWithEasing(double min, double max, double t) 
 ```

- **_lastPosition**: `OffsetPair`
- **_lastPressure**: `double`
- **_state**: `_ForceState`
## Constructors

### Unnamed Constructor
Creates a force press gesture recognizer.

 The [startPressure] defaults to 0.4, and [peakPressure] defaults to 0.85
 where a value of 0.0 is no pressure and a value of 1.0 is maximum pressure.

 The [startPressure], [peakPressure] and [interpolation] arguments must not
 be null. The [peakPressure] argument must be greater than [startPressure].
 The [interpolation] callback must always return a value in the range 0.0
 to 1.0 for values of `pressure` that are between `pressureMin` and
 `pressureMax`.

 

