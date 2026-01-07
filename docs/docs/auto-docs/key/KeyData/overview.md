# Overview for `KeyData`

## Description

Information about a key event.

## Members

- **timeStamp**: `Duration`
  Time of event dispatch, relative to an arbitrary timeline.

 For synthesized events, the [timeStamp] might not be the actual time that
 the key press or release happens.

- **type**: `KeyEventType`
  The type of the event.

- **deviceType**: `KeyEventDeviceType`
  Describes what type of device (keyboard, directional pad, etc.) this event
 originated from.

- **physical**: `int`
  The key code for the physical key that has changed.

- **logical**: `int`
  The key code for the logical key that has changed.

- **character**: `String?`
  Character input from the event.

 Ignored for up events.

- **synthesized**: `bool`
  If [synthesized] is true, this event does not correspond to a native
 event.

 Although most of Flutter's keyboard events are transformed from native
 events, some events are not based on native events, and are synthesized
 only to conform Flutter's key event model (as documented in the
 `HardwareKeyboard` class in the framework).

 For example, some key downs or ups might be lost when the window loses
 focus. Some platforms provide ways to query whether a key is being held.
 If the embedder detects an inconsistency between its internal record and
 the state returned by the system, the embedder will synthesize a
 corresponding event to synchronize the state without breaking the event
 model.

 As another example, macOS treats CapsLock in a special way by sending down
 and up events at the down of alternate presses to indicate the direction
 in which the lock is toggled instead of that the physical key is going. A
 macOS embedder should normalize the behavior by converting a native down
 event into a down event followed immediately by a synthesized up event,
 and the native up event also into a down event followed immediately by a
 synthesized up event.

 Synthesized events do not have a trustworthy [timeStamp], and should not
 be processed as if the key actually went down or up at the time of the
 callback.

 [KeyRepeatEvent] is never synthesized.

## Constructors

### Unnamed Constructor
Creates an object that represents a key event.

