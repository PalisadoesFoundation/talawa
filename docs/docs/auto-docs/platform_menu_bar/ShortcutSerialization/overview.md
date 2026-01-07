# Overview for `ShortcutSerialization`

## Description

A class used by [MenuSerializableShortcut] to describe the shortcut for
 serialization to send to the platform for rendering a [PlatformMenuBar].

 See also:

  * [PlatformMenuBar], a widget that defines a menu bar for the platform to
    render natively.
  * [MenuSerializableShortcut], a mixin allowing a [ShortcutActivator] to
    provide data for serialization of the shortcut for sending to the
    platform.

## Members

- **_internal**: `Map&lt;String, Object?&gt;`
- **_trigger**: `LogicalKeyboardKey?`
- **_character**: `String?`
- **_alt**: `bool?`
- **_control**: `bool?`
- **_meta**: `bool?`
- **_shift**: `bool?`
- **_shortcutModifierAlt**: `int`
  The bit mask for the [LogicalKeyboardKey.alt] key (or it's left/right
 equivalents) being down.

- **_shortcutModifierControl**: `int`
  The bit mask for the [LogicalKeyboardKey.control] key (or it's left/right
 equivalents) being down.

- **_shortcutModifierMeta**: `int`
  The bit mask for the [LogicalKeyboardKey.meta] key (or it's left/right
 equivalents) being down.

- **_shortcutModifierShift**: `int`
  The bit mask for the [LogicalKeyboardKey.shift] key (or it's left/right
 equivalents) being down.

## Constructors

### character
Creates a [ShortcutSerialization] representing a single character.

 This is used by a [CharacterActivator] to serialize itself.

#### Parameters

- `character`: `String`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### modifier
Creates a [ShortcutSerialization] representing a specific
 [LogicalKeyboardKey] and modifiers.

 This is used by a [SingleActivator] to serialize itself.

#### Parameters

- `trigger`: `LogicalKeyboardKey`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
