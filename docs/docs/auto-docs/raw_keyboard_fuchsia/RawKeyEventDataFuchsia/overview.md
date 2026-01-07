# Overview for `RawKeyEventDataFuchsia`

## Description

Platform-specific key event data for Fuchsia.

 This class is deprecated and will be removed. Platform specific key event
 data will no longer be available. See [KeyEvent] for what is available.

 This object contains information about key events obtained from Fuchsia's
 `KeyData` interface.

 See also:

 * [RawKeyboard], which uses this interface to expose key data.

## Dependencies

- RawKeyEventData

## Members

- **hidUsage**: `int`
  The USB HID usage.

 See <http://www.usb.org/developers/hidpage/Hut1_12v2.pdf> for more
 information.

- **codePoint**: `int`
  The Unicode code point represented by the key event, if any.

 If there is no Unicode code point, this value is zero.

 Dead keys are represented as Unicode combining characters.

- **modifiers**: `int`
  The modifiers that were present when the key event occurred.

 See <https://android.googlesource.com/platform/prebuilts/fuchsia_sdk/+/main/fidl/fuchsia.ui.input/input_event_constants.fidl>
 for the numerical values of the modifiers. Many of these are also
 replicated as static constants in this class.

 See also:

  * [modifiersPressed], which returns a Map of currently pressed modifiers
    and their keyboard side.
  * [isModifierPressed], to see if a specific modifier is pressed.
  * [isControlPressed], to see if a CTRL key is pressed.
  * [isShiftPressed], to see if a SHIFT key is pressed.
  * [isAltPressed], to see if an ALT key is pressed.
  * [isMetaPressed], to see if a META key is pressed.

- **modifierNone**: `int`
  The [modifiers] field indicates that no modifier keys are pressed if it
 equals this value.

 Use this value if you need to decode the [modifiers] field yourself, but
 it's much easier to use [isModifierPressed] if you just want to know if
 a modifier is pressed.

- **modifierCapsLock**: `int`
  This mask is used to check the [modifiers] field to test whether the CAPS
 LOCK modifier key is on.

 Use this value if you need to decode the [modifiers] field yourself, but
 it's much easier to use [isModifierPressed] if you just want to know if
 a modifier is pressed.

- **modifierLeftShift**: `int`
  This mask is used to check the [modifiers] field to test whether the left
 SHIFT modifier key is pressed.

 Use this value if you need to decode the [modifiers] field yourself, but
 it's much easier to use [isModifierPressed] if you just want to know if
 a modifier is pressed.

- **modifierRightShift**: `int`
  This mask is used to check the [modifiers] field to test whether the right
 SHIFT modifier key is pressed.

 Use this value if you need to decode the [modifiers] field yourself, but
 it's much easier to use [isModifierPressed] if you just want to know if
 a modifier is pressed.

- **modifierShift**: `int`
  This mask is used to check the [modifiers] field to test whether one of
 the SHIFT modifier keys is pressed.

 Use this value if you need to decode the [modifiers] field yourself, but
 it's much easier to use [isModifierPressed] if you just want to know if
 a modifier is pressed.

- **modifierLeftControl**: `int`
  This mask is used to check the [modifiers] field to test whether the left
 CTRL modifier key is pressed.

 Use this value if you need to decode the [modifiers] field yourself, but
 it's much easier to use [isModifierPressed] if you just want to know if
 a modifier is pressed.

- **modifierRightControl**: `int`
  This mask is used to check the [modifiers] field to test whether the right
 CTRL modifier key is pressed.

 Use this value if you need to decode the [modifiers] field yourself, but
 it's much easier to use [isModifierPressed] if you just want to know if
 a modifier is pressed.

- **modifierControl**: `int`
  This mask is used to check the [modifiers] field to test whether one of
 the CTRL modifier keys is pressed.

 Use this value if you need to decode the [modifiers] field yourself, but
 it's much easier to use [isModifierPressed] if you just want to know if
 a modifier is pressed.

- **modifierLeftAlt**: `int`
  This mask is used to check the [modifiers] field to test whether the left
 ALT modifier key is pressed.

 Use this value if you need to decode the [modifiers] field yourself, but
 it's much easier to use [isModifierPressed] if you just want to know if
 a modifier is pressed.

- **modifierRightAlt**: `int`
  This mask is used to check the [modifiers] field to test whether the right
 ALT modifier key is pressed.

 Use this value if you need to decode the [modifiers] field yourself, but
 it's much easier to use [isModifierPressed] if you just want to know if
 a modifier is pressed.

- **modifierAlt**: `int`
  This mask is used to check the [modifiers] field to test whether one of
 the ALT modifier keys is pressed.

 Use this value if you need to decode the [modifiers] field yourself, but
 it's much easier to use [isModifierPressed] if you just want to know if
 a modifier is pressed.

- **modifierLeftMeta**: `int`
  This mask is used to check the [modifiers] field to test whether the left
 META modifier key is pressed.

 Use this value if you need to decode the [modifiers] field yourself, but
 it's much easier to use [isModifierPressed] if you just want to know if
 a modifier is pressed.

- **modifierRightMeta**: `int`
  This mask is used to check the [modifiers] field to test whether the right
 META modifier key is pressed.

 Use this value if you need to decode the [modifiers] field yourself, but
 it's much easier to use [isModifierPressed] if you just want to know if
 a modifier is pressed.

- **modifierMeta**: `int`
  This mask is used to check the [modifiers] field to test whether one of
 the META modifier keys is pressed.

 Use this value if you need to decode the [modifiers] field yourself, but
 it's much easier to use [isModifierPressed] if you just want to know if
 a modifier is pressed.

## Constructors

### Unnamed Constructor
Creates a key event data structure specific for Fuchsia.

