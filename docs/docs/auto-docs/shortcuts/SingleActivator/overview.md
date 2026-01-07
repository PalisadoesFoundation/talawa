# Overview for `SingleActivator`

## Description

A shortcut key combination of a single key and modifiers.

 The [SingleActivator] implements typical shortcuts such as:

  * ArrowLeft
  * Shift + Delete
  * Control + Alt + Meta + Shift + A

 More specifically, it creates shortcut key combinations that are composed of a
 [trigger] key, and zero, some, or all of the four modifiers (control, shift,
 alt, meta). The shortcut is activated when the following conditions are met:

  * The incoming event is a down event for a [trigger] key.
  * If [control] is true, then at least one control key must be held.
    Otherwise, no control keys must be held.
  * Similar conditions apply for the [alt], [shift], and [meta] keys.

 This resembles the typical behavior of most operating systems, and handles
 modifier keys differently from [LogicalKeySet] in the following way:

  * [SingleActivator]s allow additional non-modifier keys being pressed in
    order to activate the shortcut. For example, pressing key X while holding
    ControlLeft *and key A* will be accepted by
    `SingleActivator(LogicalKeyboardKey.keyX, control: true)`.
  * [SingleActivator]s do not consider modifiers to be a trigger key. For
    example, pressing ControlLeft while holding key X *will not* activate a
    `SingleActivator(LogicalKeyboardKey.keyX, control: true)`.

 See also:

  * [CharacterActivator], an activator that represents key combinations
    that result in the specified character, such as question mark.

## Dependencies

- Diagnosticable, MenuSerializableShortcut, ShortcutActivator

## Members

- **trigger**: `LogicalKeyboardKey`
  The non-modifier key of the shortcut that is pressed after all modifiers
 to activate the shortcut.

 For example, for `Control + C`, [trigger] should be
 [LogicalKeyboardKey.keyC].

- **control**: `bool`
  Whether either (or both) control keys should be held for [trigger] to
 activate the shortcut.

 It defaults to false, meaning all Control keys must be released when the
 event is received in order to activate the shortcut. If it's true, then
 either or both Control keys must be pressed.

 See also:

  * [LogicalKeyboardKey.controlLeft], [LogicalKeyboardKey.controlRight].

- **shift**: `bool`
  Whether either (or both) shift keys should be held for [trigger] to
 activate the shortcut.

 It defaults to false, meaning all Shift keys must be released when the
 event is received in order to activate the shortcut. If it's true, then
 either or both Shift keys must be pressed.

 See also:

  * [LogicalKeyboardKey.shiftLeft], [LogicalKeyboardKey.shiftRight].

- **alt**: `bool`
  Whether either (or both) alt keys should be held for [trigger] to
 activate the shortcut.

 It defaults to false, meaning all Alt keys must be released when the
 event is received in order to activate the shortcut. If it's true, then
 either or both Alt keys must be pressed.

 See also:

  * [LogicalKeyboardKey.altLeft], [LogicalKeyboardKey.altRight].

- **meta**: `bool`
  Whether either (or both) meta keys should be held for [trigger] to
 activate the shortcut.

 It defaults to false, meaning all Meta keys must be released when the
 event is received in order to activate the shortcut. If it's true, then
 either or both Meta keys must be pressed.

 See also:

  * [LogicalKeyboardKey.metaLeft], [LogicalKeyboardKey.metaRight].

- **numLock**: `LockState`
  Whether the NumLock key state should be checked for [trigger] to activate
 the shortcut.

 It defaults to [LockState.ignored], meaning the NumLock state is ignored
 when the event is received in order to activate the shortcut.
 If it's [LockState.locked], then the NumLock key must be locked.
 If it's [LockState.unlocked], then the NumLock key must be unlocked.

 See also:

  * [LogicalKeyboardKey.numLock].

- **includeRepeats**: `bool`
  Whether this activator accepts repeat events of the [trigger] key.

 If [includeRepeats] is true, the activator is checked on all
 [KeyDownEvent] or [KeyRepeatEvent]s for the [trigger] key. If
 [includeRepeats] is false, only [trigger] key events which are
 [KeyDownEvent]s will be considered.

## Constructors

### Unnamed Constructor
Triggered when the [trigger] key is pressed while the modifiers are held.

 The [trigger] should be the non-modifier key that is pressed after all the
 modifiers, such as [LogicalKeyboardKey.keyC] as in `Ctrl+C`. It must not
 be a modifier key (sided or unsided).

 The [control], [shift], [alt], and [meta] flags represent whether the
 respective modifier keys should be held (true) or released (false). They
 default to false.

 By default, the activator is checked on all [KeyDownEvent] events for the
 [trigger] key. If [includeRepeats] is false, only [trigger] key events
 which are not [KeyRepeatEvent]s will be considered.

 
 In the following example, the shortcut `Control + C` increases the
 counter:

 ** See code in examples/api/lib/widgets/shortcuts/single_activator.0.dart **
 

