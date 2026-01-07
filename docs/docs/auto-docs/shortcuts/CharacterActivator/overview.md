# Overview for `CharacterActivator`

## Description

A shortcut combination that is triggered by a key event that produces a
 specific character.

 Keys often produce different characters when combined with modifiers. For
 example, it might be helpful for the user to bring up a help menu by
 pressing the question mark ('?'). However, there is no logical key that
 directly represents a question mark. Although 'Shift+Slash' produces a '?'
 character on a US keyboard, its logical key is still considered a Slash key,
 and hard-coding 'Shift+Slash' in this situation is unfriendly to other
 keyboard layouts.

 For example, `CharacterActivator('?')` is triggered when a key combination
 results in a question mark, which is 'Shift+Slash' on a US keyboard, but
 'Shift+Comma' on a French keyboard.

 
 In the following example, when a key combination results in a question mark,
 the [SnackBar] gets shown:

 ** See code in examples/api/lib/widgets/shortcuts/character_activator.0.dart **
 

 The [alt], [control], and [meta] flags represent whether the respective
 modifier keys should be held (true) or released (false). They default to
 false. [CharacterActivator] cannot check shifted keys, since the Shift key
 affects the resulting character, and will accept whether either of the
 Shift keys are pressed or not, as long as the key event produces the
 correct character.

 By default, the activator is checked on all [KeyDownEvent] or
 [KeyRepeatEvent]s for the [character] in combination with the requested
 modifier keys. If `includeRepeats` is false, only the [character] events
 with that are [KeyDownEvent]s will be considered.

 
 On macOS and iOS, the [alt] flag indicates that the Option key (⌥) is
 pressed. Because the Option key affects the character generated on these
 platforms, it can be unintuitive to define [CharacterActivator]s for them.

 For instance, if you want the shortcut to trigger when Option+s (⌥-s) is
 pressed, and what you intend is to trigger whenever the character 'ß' is
 produced, you would use `CharacterActivator('ß')` or
 `CharacterActivator('ß', alt: true)` instead of `CharacterActivator('s',
 alt: true)`. This is because `CharacterActivator('s', alt: true)` will
 never trigger, since the 's' character can't be produced when the Option
 key is held down.

 If what is intended is that the shortcut is triggered when Option+s (⌥-s)
 is pressed, regardless of which character is produced, it is better to use
 [SingleActivator], as in `SingleActivator(LogicalKeyboardKey.keyS, alt:
 true)`.
 

 See also:

  * [SingleActivator], an activator that represents a single key combined
    with modifiers, such as `Ctrl+C` or `Ctrl-Right Arrow`.

## Dependencies

- Diagnosticable, MenuSerializableShortcut, ShortcutActivator

## Members

- **alt**: `bool`
  Whether either (or both) Alt keys should be held for the [character] to
 activate the shortcut.

 It defaults to false, meaning all Alt keys must be released when the event
 is received in order to activate the shortcut. If it's true, then either
 one or both Alt keys must be pressed.

 

 See also:

 * [LogicalKeyboardKey.altLeft], [LogicalKeyboardKey.altRight].

- **control**: `bool`
  Whether either (or both) Control keys should be held for the [character]
 to activate the shortcut.

 It defaults to false, meaning all Control keys must be released when the
 event is received in order to activate the shortcut. If it's true, then
 either one or both Control keys must be pressed.

 See also:

  * [LogicalKeyboardKey.controlLeft], [LogicalKeyboardKey.controlRight].

- **meta**: `bool`
  Whether either (or both) Meta keys should be held for the [character] to
 activate the shortcut.

 It defaults to false, meaning all Meta keys must be released when the
 event is received in order to activate the shortcut. If it's true, then
 either one or both Meta keys must be pressed.

 See also:

  * [LogicalKeyboardKey.metaLeft], [LogicalKeyboardKey.metaRight].

- **includeRepeats**: `bool`
  Whether this activator accepts repeat events of the [character].

 If [includeRepeats] is true, the activator is checked on all
 [KeyDownEvent] and [KeyRepeatEvent]s for the [character]. If
 [includeRepeats] is false, only the [character] events that are
 [KeyDownEvent]s will be considered.

- **character**: `String`
  The character which triggers the shortcut.

 This is typically a single-character string, such as '?' or 'œ', although
 [CharacterActivator] doesn't check the length of [character] or whether it
 can be matched by any key combination at all. It is case-sensitive, since
 the [character] is directly compared by `==` to the character reported by
 the platform.

 See also:

  * [KeyEvent.character], the character of a key event.

## Constructors

### Unnamed Constructor
Triggered when the key event yields the given character.

