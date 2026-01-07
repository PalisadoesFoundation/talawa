# Overview for `PhysicalKeyboardKey`

## Description

A class with static values that describe the keys that are returned from
 [RawKeyEvent.physicalKey].

 These represent *physical* keys, which are keys which represent a particular
 key location on a QWERTY keyboard. It ignores any modifiers, modes, or
 keyboard layouts which may be in effect. This is contrast to
 [LogicalKeyboardKey], which represents a logical key interpreted in the
 context of modifiers, modes, and/or keyboard layouts.

 As an example, if you wanted a game where the key next to the CAPS LOCK (the
 "A" key on a QWERTY keyboard) moved the player to the left, you'd want to
 look at the physical key to make sure that regardless of the character the
 key produces, you got the key that is in that location on the keyboard.

 Conversely, if you wanted to implement an app where the "Q" key "quit"
 something, you'd want to look at the logical key to detect this, since you
 would like to have it match the key with "Q" on it, instead of always
 looking for "the key next to the TAB key", since on a French keyboard,
 the key next to the TAB key has an "A" on it.

 
 This example shows how to detect if the user has selected the physical key
 to the right of the CAPS LOCK key.

 ** See code in examples/api/lib/services/keyboard_key/physical_keyboard_key.0.dart **
 

 See also:

  * [RawKeyEvent], the keyboard event object received by widgets that listen
    to keyboard events.
  * [Focus.onKey], the handler on a widget that lets you handle key events.
  * [RawKeyboardListener], a widget used to listen to keyboard events (but
    not handle them).

## Dependencies

- KeyboardKey

## Members

- **usbHidUsage**: `int`
  The unique USB HID usage ID of this physical key on the keyboard.

 Due to the variations in platform APIs, this may not be the actual HID
 usage code from the hardware, but a value derived from available
 information on the platform.

 See <https://www.usb.org/sites/default/files/documents/hut1_12v2.pdf>
 for the HID usage values and their meanings.

- **hyper**: `PhysicalKeyboardKey`
  Represents the location of the "Hyper" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **superKey**: `PhysicalKeyboardKey`
  Represents the location of the "Super Key" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **fn**: `PhysicalKeyboardKey`
  Represents the location of the "Fn" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **fnLock**: `PhysicalKeyboardKey`
  Represents the location of the "Fn Lock" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **suspend**: `PhysicalKeyboardKey`
  Represents the location of the "Suspend" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **resume**: `PhysicalKeyboardKey`
  Represents the location of the "Resume" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **turbo**: `PhysicalKeyboardKey`
  Represents the location of the "Turbo" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **privacyScreenToggle**: `PhysicalKeyboardKey`
  Represents the location of the "Privacy Screen Toggle" key on a
 generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **microphoneMuteToggle**: `PhysicalKeyboardKey`
  Represents the location of the "Microphone Mute Toggle" key on a
 generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **sleep**: `PhysicalKeyboardKey`
  Represents the location of the "Sleep" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **wakeUp**: `PhysicalKeyboardKey`
  Represents the location of the "Wake Up" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **displayToggleIntExt**: `PhysicalKeyboardKey`
  Represents the location of the "Display Toggle Int Ext" key on a
 generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **gameButton1**: `PhysicalKeyboardKey`
  Represents the location of the "Game Button 1" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **gameButton2**: `PhysicalKeyboardKey`
  Represents the location of the "Game Button 2" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **gameButton3**: `PhysicalKeyboardKey`
  Represents the location of the "Game Button 3" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **gameButton4**: `PhysicalKeyboardKey`
  Represents the location of the "Game Button 4" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **gameButton5**: `PhysicalKeyboardKey`
  Represents the location of the "Game Button 5" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **gameButton6**: `PhysicalKeyboardKey`
  Represents the location of the "Game Button 6" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **gameButton7**: `PhysicalKeyboardKey`
  Represents the location of the "Game Button 7" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **gameButton8**: `PhysicalKeyboardKey`
  Represents the location of the "Game Button 8" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **gameButton9**: `PhysicalKeyboardKey`
  Represents the location of the "Game Button 9" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **gameButton10**: `PhysicalKeyboardKey`
  Represents the location of the "Game Button 10" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **gameButton11**: `PhysicalKeyboardKey`
  Represents the location of the "Game Button 11" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **gameButton12**: `PhysicalKeyboardKey`
  Represents the location of the "Game Button 12" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **gameButton13**: `PhysicalKeyboardKey`
  Represents the location of the "Game Button 13" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **gameButton14**: `PhysicalKeyboardKey`
  Represents the location of the "Game Button 14" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **gameButton15**: `PhysicalKeyboardKey`
  Represents the location of the "Game Button 15" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **gameButton16**: `PhysicalKeyboardKey`
  Represents the location of the "Game Button 16" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **gameButtonA**: `PhysicalKeyboardKey`
  Represents the location of the "Game Button A" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **gameButtonB**: `PhysicalKeyboardKey`
  Represents the location of the "Game Button B" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **gameButtonC**: `PhysicalKeyboardKey`
  Represents the location of the "Game Button C" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **gameButtonLeft1**: `PhysicalKeyboardKey`
  Represents the location of the "Game Button Left 1" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **gameButtonLeft2**: `PhysicalKeyboardKey`
  Represents the location of the "Game Button Left 2" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **gameButtonMode**: `PhysicalKeyboardKey`
  Represents the location of the "Game Button Mode" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **gameButtonRight1**: `PhysicalKeyboardKey`
  Represents the location of the "Game Button Right 1" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **gameButtonRight2**: `PhysicalKeyboardKey`
  Represents the location of the "Game Button Right 2" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **gameButtonSelect**: `PhysicalKeyboardKey`
  Represents the location of the "Game Button Select" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **gameButtonStart**: `PhysicalKeyboardKey`
  Represents the location of the "Game Button Start" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **gameButtonThumbLeft**: `PhysicalKeyboardKey`
  Represents the location of the "Game Button Thumb Left" key on a
 generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **gameButtonThumbRight**: `PhysicalKeyboardKey`
  Represents the location of the "Game Button Thumb Right" key on a
 generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **gameButtonX**: `PhysicalKeyboardKey`
  Represents the location of the "Game Button X" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **gameButtonY**: `PhysicalKeyboardKey`
  Represents the location of the "Game Button Y" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **gameButtonZ**: `PhysicalKeyboardKey`
  Represents the location of the "Game Button Z" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **usbReserved**: `PhysicalKeyboardKey`
  Represents the location of the "Usb Reserved" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **usbErrorRollOver**: `PhysicalKeyboardKey`
  Represents the location of the "Usb Error Roll Over" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **usbPostFail**: `PhysicalKeyboardKey`
  Represents the location of the "Usb Post Fail" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **usbErrorUndefined**: `PhysicalKeyboardKey`
  Represents the location of the "Usb Error Undefined" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **keyA**: `PhysicalKeyboardKey`
  Represents the location of the "Key A" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **keyB**: `PhysicalKeyboardKey`
  Represents the location of the "Key B" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **keyC**: `PhysicalKeyboardKey`
  Represents the location of the "Key C" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **keyD**: `PhysicalKeyboardKey`
  Represents the location of the "Key D" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **keyE**: `PhysicalKeyboardKey`
  Represents the location of the "Key E" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **keyF**: `PhysicalKeyboardKey`
  Represents the location of the "Key F" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **keyG**: `PhysicalKeyboardKey`
  Represents the location of the "Key G" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **keyH**: `PhysicalKeyboardKey`
  Represents the location of the "Key H" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **keyI**: `PhysicalKeyboardKey`
  Represents the location of the "Key I" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **keyJ**: `PhysicalKeyboardKey`
  Represents the location of the "Key J" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **keyK**: `PhysicalKeyboardKey`
  Represents the location of the "Key K" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **keyL**: `PhysicalKeyboardKey`
  Represents the location of the "Key L" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **keyM**: `PhysicalKeyboardKey`
  Represents the location of the "Key M" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **keyN**: `PhysicalKeyboardKey`
  Represents the location of the "Key N" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **keyO**: `PhysicalKeyboardKey`
  Represents the location of the "Key O" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **keyP**: `PhysicalKeyboardKey`
  Represents the location of the "Key P" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **keyQ**: `PhysicalKeyboardKey`
  Represents the location of the "Key Q" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **keyR**: `PhysicalKeyboardKey`
  Represents the location of the "Key R" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **keyS**: `PhysicalKeyboardKey`
  Represents the location of the "Key S" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **keyT**: `PhysicalKeyboardKey`
  Represents the location of the "Key T" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **keyU**: `PhysicalKeyboardKey`
  Represents the location of the "Key U" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **keyV**: `PhysicalKeyboardKey`
  Represents the location of the "Key V" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **keyW**: `PhysicalKeyboardKey`
  Represents the location of the "Key W" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **keyX**: `PhysicalKeyboardKey`
  Represents the location of the "Key X" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **keyY**: `PhysicalKeyboardKey`
  Represents the location of the "Key Y" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **keyZ**: `PhysicalKeyboardKey`
  Represents the location of the "Key Z" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **digit1**: `PhysicalKeyboardKey`
  Represents the location of the "Digit 1" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **digit2**: `PhysicalKeyboardKey`
  Represents the location of the "Digit 2" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **digit3**: `PhysicalKeyboardKey`
  Represents the location of the "Digit 3" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **digit4**: `PhysicalKeyboardKey`
  Represents the location of the "Digit 4" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **digit5**: `PhysicalKeyboardKey`
  Represents the location of the "Digit 5" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **digit6**: `PhysicalKeyboardKey`
  Represents the location of the "Digit 6" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **digit7**: `PhysicalKeyboardKey`
  Represents the location of the "Digit 7" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **digit8**: `PhysicalKeyboardKey`
  Represents the location of the "Digit 8" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **digit9**: `PhysicalKeyboardKey`
  Represents the location of the "Digit 9" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **digit0**: `PhysicalKeyboardKey`
  Represents the location of the "Digit 0" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **enter**: `PhysicalKeyboardKey`
  Represents the location of the "Enter" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **escape**: `PhysicalKeyboardKey`
  Represents the location of the "Escape" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **backspace**: `PhysicalKeyboardKey`
  Represents the location of the "Backspace" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **tab**: `PhysicalKeyboardKey`
  Represents the location of the "Tab" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **space**: `PhysicalKeyboardKey`
  Represents the location of the "Space" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **minus**: `PhysicalKeyboardKey`
  Represents the location of the "Minus" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **equal**: `PhysicalKeyboardKey`
  Represents the location of the "Equal" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **bracketLeft**: `PhysicalKeyboardKey`
  Represents the location of the "Bracket Left" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **bracketRight**: `PhysicalKeyboardKey`
  Represents the location of the "Bracket Right" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **backslash**: `PhysicalKeyboardKey`
  Represents the location of the "Backslash" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **semicolon**: `PhysicalKeyboardKey`
  Represents the location of the "Semicolon" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **quote**: `PhysicalKeyboardKey`
  Represents the location of the "Quote" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **backquote**: `PhysicalKeyboardKey`
  Represents the location of the "Backquote" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **comma**: `PhysicalKeyboardKey`
  Represents the location of the "Comma" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **period**: `PhysicalKeyboardKey`
  Represents the location of the "Period" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **slash**: `PhysicalKeyboardKey`
  Represents the location of the "Slash" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **capsLock**: `PhysicalKeyboardKey`
  Represents the location of the "Caps Lock" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **f1**: `PhysicalKeyboardKey`
  Represents the location of the "F1" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **f2**: `PhysicalKeyboardKey`
  Represents the location of the "F2" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **f3**: `PhysicalKeyboardKey`
  Represents the location of the "F3" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **f4**: `PhysicalKeyboardKey`
  Represents the location of the "F4" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **f5**: `PhysicalKeyboardKey`
  Represents the location of the "F5" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **f6**: `PhysicalKeyboardKey`
  Represents the location of the "F6" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **f7**: `PhysicalKeyboardKey`
  Represents the location of the "F7" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **f8**: `PhysicalKeyboardKey`
  Represents the location of the "F8" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **f9**: `PhysicalKeyboardKey`
  Represents the location of the "F9" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **f10**: `PhysicalKeyboardKey`
  Represents the location of the "F10" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **f11**: `PhysicalKeyboardKey`
  Represents the location of the "F11" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **f12**: `PhysicalKeyboardKey`
  Represents the location of the "F12" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **printScreen**: `PhysicalKeyboardKey`
  Represents the location of the "Print Screen" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **scrollLock**: `PhysicalKeyboardKey`
  Represents the location of the "Scroll Lock" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **pause**: `PhysicalKeyboardKey`
  Represents the location of the "Pause" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **insert**: `PhysicalKeyboardKey`
  Represents the location of the "Insert" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **home**: `PhysicalKeyboardKey`
  Represents the location of the "Home" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **pageUp**: `PhysicalKeyboardKey`
  Represents the location of the "Page Up" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **delete**: `PhysicalKeyboardKey`
  Represents the location of the "Delete" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **end**: `PhysicalKeyboardKey`
  Represents the location of the "End" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **pageDown**: `PhysicalKeyboardKey`
  Represents the location of the "Page Down" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **arrowRight**: `PhysicalKeyboardKey`
  Represents the location of the "Arrow Right" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **arrowLeft**: `PhysicalKeyboardKey`
  Represents the location of the "Arrow Left" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **arrowDown**: `PhysicalKeyboardKey`
  Represents the location of the "Arrow Down" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **arrowUp**: `PhysicalKeyboardKey`
  Represents the location of the "Arrow Up" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **numLock**: `PhysicalKeyboardKey`
  Represents the location of the "Num Lock" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **numpadDivide**: `PhysicalKeyboardKey`
  Represents the location of the "Numpad Divide" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **numpadMultiply**: `PhysicalKeyboardKey`
  Represents the location of the "Numpad Multiply" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **numpadSubtract**: `PhysicalKeyboardKey`
  Represents the location of the "Numpad Subtract" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **numpadAdd**: `PhysicalKeyboardKey`
  Represents the location of the "Numpad Add" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **numpadEnter**: `PhysicalKeyboardKey`
  Represents the location of the "Numpad Enter" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **numpad1**: `PhysicalKeyboardKey`
  Represents the location of the "Numpad 1" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **numpad2**: `PhysicalKeyboardKey`
  Represents the location of the "Numpad 2" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **numpad3**: `PhysicalKeyboardKey`
  Represents the location of the "Numpad 3" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **numpad4**: `PhysicalKeyboardKey`
  Represents the location of the "Numpad 4" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **numpad5**: `PhysicalKeyboardKey`
  Represents the location of the "Numpad 5" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **numpad6**: `PhysicalKeyboardKey`
  Represents the location of the "Numpad 6" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **numpad7**: `PhysicalKeyboardKey`
  Represents the location of the "Numpad 7" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **numpad8**: `PhysicalKeyboardKey`
  Represents the location of the "Numpad 8" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **numpad9**: `PhysicalKeyboardKey`
  Represents the location of the "Numpad 9" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **numpad0**: `PhysicalKeyboardKey`
  Represents the location of the "Numpad 0" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **numpadDecimal**: `PhysicalKeyboardKey`
  Represents the location of the "Numpad Decimal" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **intlBackslash**: `PhysicalKeyboardKey`
  Represents the location of the "Intl Backslash" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **contextMenu**: `PhysicalKeyboardKey`
  Represents the location of the "Context Menu" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **power**: `PhysicalKeyboardKey`
  Represents the location of the "Power" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **numpadEqual**: `PhysicalKeyboardKey`
  Represents the location of the "Numpad Equal" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **f13**: `PhysicalKeyboardKey`
  Represents the location of the "F13" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **f14**: `PhysicalKeyboardKey`
  Represents the location of the "F14" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **f15**: `PhysicalKeyboardKey`
  Represents the location of the "F15" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **f16**: `PhysicalKeyboardKey`
  Represents the location of the "F16" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **f17**: `PhysicalKeyboardKey`
  Represents the location of the "F17" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **f18**: `PhysicalKeyboardKey`
  Represents the location of the "F18" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **f19**: `PhysicalKeyboardKey`
  Represents the location of the "F19" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **f20**: `PhysicalKeyboardKey`
  Represents the location of the "F20" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **f21**: `PhysicalKeyboardKey`
  Represents the location of the "F21" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **f22**: `PhysicalKeyboardKey`
  Represents the location of the "F22" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **f23**: `PhysicalKeyboardKey`
  Represents the location of the "F23" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **f24**: `PhysicalKeyboardKey`
  Represents the location of the "F24" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **open**: `PhysicalKeyboardKey`
  Represents the location of the "Open" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **help**: `PhysicalKeyboardKey`
  Represents the location of the "Help" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **select**: `PhysicalKeyboardKey`
  Represents the location of the "Select" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **again**: `PhysicalKeyboardKey`
  Represents the location of the "Again" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **undo**: `PhysicalKeyboardKey`
  Represents the location of the "Undo" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **cut**: `PhysicalKeyboardKey`
  Represents the location of the "Cut" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **copy**: `PhysicalKeyboardKey`
  Represents the location of the "Copy" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **paste**: `PhysicalKeyboardKey`
  Represents the location of the "Paste" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **find**: `PhysicalKeyboardKey`
  Represents the location of the "Find" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **audioVolumeMute**: `PhysicalKeyboardKey`
  Represents the location of the "Audio Volume Mute" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **audioVolumeUp**: `PhysicalKeyboardKey`
  Represents the location of the "Audio Volume Up" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **audioVolumeDown**: `PhysicalKeyboardKey`
  Represents the location of the "Audio Volume Down" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **numpadComma**: `PhysicalKeyboardKey`
  Represents the location of the "Numpad Comma" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **intlRo**: `PhysicalKeyboardKey`
  Represents the location of the "Intl Ro" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **kanaMode**: `PhysicalKeyboardKey`
  Represents the location of the "Kana Mode" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **intlYen**: `PhysicalKeyboardKey`
  Represents the location of the "Intl Yen" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **convert**: `PhysicalKeyboardKey`
  Represents the location of the "Convert" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **nonConvert**: `PhysicalKeyboardKey`
  Represents the location of the "Non Convert" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **lang1**: `PhysicalKeyboardKey`
  Represents the location of the "Lang 1" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **lang2**: `PhysicalKeyboardKey`
  Represents the location of the "Lang 2" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **lang3**: `PhysicalKeyboardKey`
  Represents the location of the "Lang 3" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **lang4**: `PhysicalKeyboardKey`
  Represents the location of the "Lang 4" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **lang5**: `PhysicalKeyboardKey`
  Represents the location of the "Lang 5" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **abort**: `PhysicalKeyboardKey`
  Represents the location of the "Abort" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **props**: `PhysicalKeyboardKey`
  Represents the location of the "Props" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **numpadParenLeft**: `PhysicalKeyboardKey`
  Represents the location of the "Numpad Paren Left" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **numpadParenRight**: `PhysicalKeyboardKey`
  Represents the location of the "Numpad Paren Right" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **numpadBackspace**: `PhysicalKeyboardKey`
  Represents the location of the "Numpad Backspace" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **numpadMemoryStore**: `PhysicalKeyboardKey`
  Represents the location of the "Numpad Memory Store" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **numpadMemoryRecall**: `PhysicalKeyboardKey`
  Represents the location of the "Numpad Memory Recall" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **numpadMemoryClear**: `PhysicalKeyboardKey`
  Represents the location of the "Numpad Memory Clear" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **numpadMemoryAdd**: `PhysicalKeyboardKey`
  Represents the location of the "Numpad Memory Add" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **numpadMemorySubtract**: `PhysicalKeyboardKey`
  Represents the location of the "Numpad Memory Subtract" key on a
 generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **numpadSignChange**: `PhysicalKeyboardKey`
  Represents the location of the "Numpad Sign Change" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **numpadClear**: `PhysicalKeyboardKey`
  Represents the location of the "Numpad Clear" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **numpadClearEntry**: `PhysicalKeyboardKey`
  Represents the location of the "Numpad Clear Entry" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **controlLeft**: `PhysicalKeyboardKey`
  Represents the location of the "Control Left" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **shiftLeft**: `PhysicalKeyboardKey`
  Represents the location of the "Shift Left" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **altLeft**: `PhysicalKeyboardKey`
  Represents the location of the "Alt Left" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **metaLeft**: `PhysicalKeyboardKey`
  Represents the location of the "Meta Left" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **controlRight**: `PhysicalKeyboardKey`
  Represents the location of the "Control Right" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **shiftRight**: `PhysicalKeyboardKey`
  Represents the location of the "Shift Right" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **altRight**: `PhysicalKeyboardKey`
  Represents the location of the "Alt Right" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **metaRight**: `PhysicalKeyboardKey`
  Represents the location of the "Meta Right" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **info**: `PhysicalKeyboardKey`
  Represents the location of the "Info" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **closedCaptionToggle**: `PhysicalKeyboardKey`
  Represents the location of the "Closed Caption Toggle" key on a
 generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **brightnessUp**: `PhysicalKeyboardKey`
  Represents the location of the "Brightness Up" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **brightnessDown**: `PhysicalKeyboardKey`
  Represents the location of the "Brightness Down" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **brightnessToggle**: `PhysicalKeyboardKey`
  Represents the location of the "Brightness Toggle" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **brightnessMinimum**: `PhysicalKeyboardKey`
  Represents the location of the "Brightness Minimum" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **brightnessMaximum**: `PhysicalKeyboardKey`
  Represents the location of the "Brightness Maximum" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **brightnessAuto**: `PhysicalKeyboardKey`
  Represents the location of the "Brightness Auto" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **kbdIllumUp**: `PhysicalKeyboardKey`
  Represents the location of the "Kbd Illum Up" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **kbdIllumDown**: `PhysicalKeyboardKey`
  Represents the location of the "Kbd Illum Down" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **mediaLast**: `PhysicalKeyboardKey`
  Represents the location of the "Media Last" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **launchPhone**: `PhysicalKeyboardKey`
  Represents the location of the "Launch Phone" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **programGuide**: `PhysicalKeyboardKey`
  Represents the location of the "Program Guide" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **exit**: `PhysicalKeyboardKey`
  Represents the location of the "Exit" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **channelUp**: `PhysicalKeyboardKey`
  Represents the location of the "Channel Up" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **channelDown**: `PhysicalKeyboardKey`
  Represents the location of the "Channel Down" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **mediaPlay**: `PhysicalKeyboardKey`
  Represents the location of the "Media Play" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **mediaPause**: `PhysicalKeyboardKey`
  Represents the location of the "Media Pause" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **mediaRecord**: `PhysicalKeyboardKey`
  Represents the location of the "Media Record" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **mediaFastForward**: `PhysicalKeyboardKey`
  Represents the location of the "Media Fast Forward" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **mediaRewind**: `PhysicalKeyboardKey`
  Represents the location of the "Media Rewind" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **mediaTrackNext**: `PhysicalKeyboardKey`
  Represents the location of the "Media Track Next" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **mediaTrackPrevious**: `PhysicalKeyboardKey`
  Represents the location of the "Media Track Previous" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **mediaStop**: `PhysicalKeyboardKey`
  Represents the location of the "Media Stop" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **eject**: `PhysicalKeyboardKey`
  Represents the location of the "Eject" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **mediaPlayPause**: `PhysicalKeyboardKey`
  Represents the location of the "Media Play Pause" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **speechInputToggle**: `PhysicalKeyboardKey`
  Represents the location of the "Speech Input Toggle" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **bassBoost**: `PhysicalKeyboardKey`
  Represents the location of the "Bass Boost" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **mediaSelect**: `PhysicalKeyboardKey`
  Represents the location of the "Media Select" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **launchWordProcessor**: `PhysicalKeyboardKey`
  Represents the location of the "Launch Word Processor" key on a
 generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **launchSpreadsheet**: `PhysicalKeyboardKey`
  Represents the location of the "Launch Spreadsheet" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **launchMail**: `PhysicalKeyboardKey`
  Represents the location of the "Launch Mail" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **launchContacts**: `PhysicalKeyboardKey`
  Represents the location of the "Launch Contacts" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **launchCalendar**: `PhysicalKeyboardKey`
  Represents the location of the "Launch Calendar" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **launchApp2**: `PhysicalKeyboardKey`
  Represents the location of the "Launch App2" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **launchApp1**: `PhysicalKeyboardKey`
  Represents the location of the "Launch App1" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **launchInternetBrowser**: `PhysicalKeyboardKey`
  Represents the location of the "Launch Internet Browser" key on a
 generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **logOff**: `PhysicalKeyboardKey`
  Represents the location of the "Log Off" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **lockScreen**: `PhysicalKeyboardKey`
  Represents the location of the "Lock Screen" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **launchControlPanel**: `PhysicalKeyboardKey`
  Represents the location of the "Launch Control Panel" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **selectTask**: `PhysicalKeyboardKey`
  Represents the location of the "Select Task" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **launchDocuments**: `PhysicalKeyboardKey`
  Represents the location of the "Launch Documents" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **spellCheck**: `PhysicalKeyboardKey`
  Represents the location of the "Spell Check" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **launchKeyboardLayout**: `PhysicalKeyboardKey`
  Represents the location of the "Launch Keyboard Layout" key on a
 generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **launchScreenSaver**: `PhysicalKeyboardKey`
  Represents the location of the "Launch Screen Saver" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **launchAudioBrowser**: `PhysicalKeyboardKey`
  Represents the location of the "Launch Audio Browser" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **launchAssistant**: `PhysicalKeyboardKey`
  Represents the location of the "Launch Assistant" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **newKey**: `PhysicalKeyboardKey`
  Represents the location of the "New Key" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **close**: `PhysicalKeyboardKey`
  Represents the location of the "Close" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **save**: `PhysicalKeyboardKey`
  Represents the location of the "Save" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **print**: `PhysicalKeyboardKey`
  Represents the location of the "Print" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **browserSearch**: `PhysicalKeyboardKey`
  Represents the location of the "Browser Search" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **browserHome**: `PhysicalKeyboardKey`
  Represents the location of the "Browser Home" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **browserBack**: `PhysicalKeyboardKey`
  Represents the location of the "Browser Back" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **browserForward**: `PhysicalKeyboardKey`
  Represents the location of the "Browser Forward" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **browserStop**: `PhysicalKeyboardKey`
  Represents the location of the "Browser Stop" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **browserRefresh**: `PhysicalKeyboardKey`
  Represents the location of the "Browser Refresh" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **browserFavorites**: `PhysicalKeyboardKey`
  Represents the location of the "Browser Favorites" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **zoomIn**: `PhysicalKeyboardKey`
  Represents the location of the "Zoom In" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **zoomOut**: `PhysicalKeyboardKey`
  Represents the location of the "Zoom Out" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **zoomToggle**: `PhysicalKeyboardKey`
  Represents the location of the "Zoom Toggle" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **redo**: `PhysicalKeyboardKey`
  Represents the location of the "Redo" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **mailReply**: `PhysicalKeyboardKey`
  Represents the location of the "Mail Reply" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **mailForward**: `PhysicalKeyboardKey`
  Represents the location of the "Mail Forward" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **mailSend**: `PhysicalKeyboardKey`
  Represents the location of the "Mail Send" key on a generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **keyboardLayoutSelect**: `PhysicalKeyboardKey`
  Represents the location of the "Keyboard Layout Select" key on a
 generalized keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **showAllWindows**: `PhysicalKeyboardKey`
  Represents the location of the "Show All Windows" key on a generalized
 keyboard.

 See the function [RawKeyEvent.physicalKey] for more information.

- **_knownPhysicalKeys**: `Map&lt;int, PhysicalKeyboardKey&gt;`
- **_debugNames**: `Map&lt;int, String&gt;`
## Constructors

### Unnamed Constructor
Creates a new PhysicalKeyboardKey object for a USB HID usage.

