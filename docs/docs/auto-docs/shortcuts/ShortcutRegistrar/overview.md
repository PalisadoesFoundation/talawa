# Overview for `ShortcutRegistrar`

## Description

A widget that holds a [ShortcutRegistry] which allows descendants to add,
 remove, or replace shortcuts.

 This widget holds a [ShortcutRegistry] so that its descendants can find it
 with [ShortcutRegistry.of] or [ShortcutRegistry.maybeOf].

 The registered shortcuts are valid whenever a widget below this one in the
 hierarchy has focus.

 To add shortcuts to the registry, call [ShortcutRegistry.of] or
 [ShortcutRegistry.maybeOf] to get the [ShortcutRegistry], and then add them
 using [ShortcutRegistry.addAll], which will return a [ShortcutRegistryEntry]
 which must be disposed by calling [ShortcutRegistryEntry.dispose] when the
 shortcuts are no longer needed.

 To replace or update the shortcuts in the registry, call
 [ShortcutRegistryEntry.replaceAll].

 To remove previously added shortcuts from the registry, call
 [ShortcutRegistryEntry.dispose] on the entry returned by
 [ShortcutRegistry.addAll].

## Dependencies

- StatefulWidget

## Members

- **child**: `Widget`
  The widget below this widget in the tree.

 

## Constructors

### Unnamed Constructor
Creates a const [ShortcutRegistrar].

 The [child] parameter is required.

