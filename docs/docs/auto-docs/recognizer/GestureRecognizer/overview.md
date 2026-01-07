# Overview for `GestureRecognizer`

## Description

The base class that all gesture recognizers inherit from.

 Provides a basic API that can be used by classes that work with
 gesture recognizers but don't care about the specific details of
 the gestures recognizers themselves.

 See also:

  * [GestureDetector], the widget that is used to detect built-in gestures.
  * [RawGestureDetector], the widget that is used to detect custom gestures.
  * [debugPrintRecognizerCallbacksTrace], a flag that can be set to help
    debug issues with gesture recognizers.

## Dependencies

- GestureArenaMember, DiagnosticableTreeMixin

## Members

- **debugOwner**: `Object?`
  The recognizer's owner.

 This is used in the [toString] serialization to report the object for which
 this gesture recognizer was created, to aid in debugging.

- **gestureSettings**: `DeviceGestureSettings?`
  Optional device specific configuration for device gestures that will
 take precedence over framework defaults.

- **supportedDevices**: `Set&lt;PointerDeviceKind&gt;?`
  The kind of devices that are allowed to be recognized as provided by
 `supportedDevices` in the constructor, or the currently deprecated `kind`.
 These cannot both be set. If both are null, events from all device kinds will be
 tracked and recognized.

- **allowedButtonsFilter**: `AllowedButtonsFilter`
  
 Called when interaction starts. This limits the dragging behavior
 for custom clicks (such as scroll click). Its parameter comes
 from [PointerEvent.buttons].

 Due to how [kPrimaryButton], [kSecondaryButton], etc., use integers,
 bitwise operations can help filter how buttons are pressed.
 For example, if someone simultaneously presses the primary and secondary
 buttons, the default behavior will return false. The following code
 accepts any button press with primary:
 `(int buttons) => buttons & kPrimaryButton != 0`.

 When value is `(int buttons) => false`, allow no interactions.
 When value is `(int buttons) => true`, allow all interactions.

 Defaults to all buttons.
 

- **_pointerToKind**: `Map&lt;int, PointerDeviceKind&gt;`
  Holds a mapping between pointer IDs and the kind of devices they are
 coming from.

## Constructors

### Unnamed Constructor
Initializes the gesture recognizer.

 The argument is optional and is only used for debug purposes (e.g. in the
 [toString] serialization).

 
 It's possible to limit this recognizer to a specific set of [PointerDeviceKind]s
 by providing the optional [supportedDevices] argument. If [supportedDevices] is null,
 the recognizer will accept pointer events from all device kinds.
 

