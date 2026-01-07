# Method: `addAll`

## Description

Adds all the given shortcut bindings to this [ShortcutRegistry], and
 returns a entry for managing those bindings.

 The entry should have [ShortcutRegistryEntry.dispose] called on it when
 these shortcuts are no longer needed. This will remove them from the
 registry, and invalidate the entry.

 This method will assert in debug mode if another entry exists (i.e. hasn't
 been disposed of) that has already added a given shortcut.

 If two equivalent, but different, [ShortcutActivator]s are added, all of
 them will be executed when triggered. For example, if both
 `SingleActivator(LogicalKeyboardKey.keyA)` and `CharacterActivator('a')`
 are added, then both will be executed when an "a" key is pressed.

 See also:

  * [ShortcutRegistryEntry.replaceAll], a function used to replace the set of
    shortcuts associated with a particular entry.
  * [ShortcutRegistryEntry.dispose], a function used to remove the set of
    shortcuts associated with a particular entry.

## Return Type
`ShortcutRegistryEntry`

## Parameters

- `value`: `Map&lt;ShortcutActivator, Intent&gt;`
