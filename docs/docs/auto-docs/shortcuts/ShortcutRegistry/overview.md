# Overview for `ShortcutRegistry`

## Description

A class used by [ShortcutRegistrar] that allows adding or removing shortcut
 bindings by descendants of the [ShortcutRegistrar].

 You can reach the nearest [ShortcutRegistry] using [of] and [maybeOf].

 The registry may be listened to (with [addListener]/[removeListener]) for
 change notifications when the registered shortcuts change. Change
 notifications take place after the current frame is drawn, so that
 widgets that are not descendants of the registry can listen to it (e.g. in
 overlays).

## Dependencies

- ChangeNotifier

## Members

- **_notificationScheduled**: `bool`
- **_disposed**: `bool`
- **_registeredShortcuts**: `Map&lt;ShortcutRegistryEntry, Map&lt;ShortcutActivator, Intent&gt;&gt;`
## Constructors

### Unnamed Constructor
Creates an instance of [ShortcutRegistry].

