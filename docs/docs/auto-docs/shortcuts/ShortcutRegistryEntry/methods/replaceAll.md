# Method: `replaceAll`

## Description

Replaces the given shortcut bindings in the [ShortcutRegistry] that this
 entry was created from.

 This method will assert in debug mode if another [ShortcutRegistryEntry]
 exists (i.e. hasn't been disposed of) that has already added a given
 shortcut.

 It will also assert if this entry has already been disposed.

 If two equivalent, but different, [ShortcutActivator]s are added, all of
 them will be executed when triggered. For example, if both
 `SingleActivator(LogicalKeyboardKey.keyA)` and `CharacterActivator('a')`
 are added, then both will be executed when an "a" key is pressed.

## Return Type
`void`

## Parameters

- `value`: `Map&lt;ShortcutActivator, Intent&gt;`
