# Overview for `ShortcutManager`

## Description

A manager of keyboard shortcut bindings used by [Shortcuts] to handle key
 events.

 The manager may be listened to (with [addListener]/[removeListener]) for
 change notifications when the shortcuts change.

 Typically, a [Shortcuts] widget supplies its own manager, but in uncommon
 cases where overriding the usual shortcut manager behavior is desired, a
 subclassed [ShortcutManager] may be supplied.

## Dependencies

- Diagnosticable, ChangeNotifier

## Members

- **modal**: `bool`
  True if the [ShortcutManager] should not pass on keys that it doesn't
 handle to any key-handling widgets that are ancestors to this one.

 Setting [modal] to true will prevent any key event given to this manager
 from being given to any ancestor managers, even if that key doesn't appear
 in the [shortcuts] map.

 The net effect of setting [modal] to true is to return
 [KeyEventResult.skipRemainingHandlers] from [handleKeypress] if it does
 not exist in the shortcut map, instead of returning
 [KeyEventResult.ignored].

- **_shortcuts**: `Map&lt;ShortcutActivator, Intent&gt;`
- **_indexedShortcutsCache**: `Map&lt;LogicalKeyboardKey?, List&lt;_ActivatorIntentPair&gt;&gt;?`
## Constructors

### Unnamed Constructor
Constructs a [ShortcutManager].

