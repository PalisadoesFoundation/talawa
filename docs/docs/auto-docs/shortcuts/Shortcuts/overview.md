# Overview for `Shortcuts`

## Description

A widget that creates key bindings to specific actions for its
 descendants.

 

 This widget establishes a [ShortcutManager] to be used by its descendants
 when invoking an [Action] via a keyboard key combination that maps to an
 [Intent].

 This is similar to but more powerful than the [CallbackShortcuts] widget.
 Unlike [CallbackShortcuts], this widget separates key bindings and their
 implementations. This separation allows [Shortcuts] to have key bindings
 that adapt to the focused context. For example, the desired action for a
 deletion intent may be to delete a character in a text input, or to delete
 a file in a file menu.

 See the article on
 [Using Actions and Shortcuts](https://flutter.dev/to/actions-shortcuts)
 for a detailed explanation.

 
 Here, we will use the [Shortcuts] and [Actions] widgets to add and subtract
 from a counter. When the child widget has keyboard focus, and a user presses
 the keys that have been defined in [Shortcuts], the action that is bound
 to the appropriate [Intent] for the key is invoked.

 It also shows the use of a [CallbackAction] to avoid creating a new [Action]
 subclass.

 ** See code in examples/api/lib/widgets/shortcuts/shortcuts.0.dart **
 

 
 This slightly more complicated, but more flexible, example creates a custom
 [Action] subclass to increment and decrement within a widget (a [Column])
 that has keyboard focus. When the user presses the up and down arrow keys,
 the counter will increment and decrement a data model using the custom
 actions.

 One thing that this demonstrates is passing arguments to the [Intent] to be
 carried to the [Action]. This shows how actions can get data either from
 their own construction (like the `model` in this example), or from the
 intent passed to them when invoked (like the increment `amount` in this
 example).

 ** See code in examples/api/lib/widgets/shortcuts/shortcuts.1.dart **
 

 See also:

  * [CallbackShortcuts], a simpler but less flexible widget that defines key
    bindings that invoke callbacks.
  * [Intent], a class for containing a description of a user action to be
    invoked.
  * [Action], a class for defining an invocation of a user action.
  * [CallbackAction], a class for creating an action from a callback.

## Dependencies

- StatefulWidget

## Members

- **manager**: `ShortcutManager?`
  The [ShortcutManager] that will manage the mapping between key
 combinations and [Action]s.

 If this widget was created with [Shortcuts.manager], then
 [ShortcutManager.shortcuts] will be used as the source for shortcuts. If
 the unnamed constructor is used, this manager will be null, and a
 default-constructed [ShortcutManager] will be used.

- **_shortcuts**: `Map&lt;ShortcutActivator, Intent&gt;`
- **child**: `Widget`
  The child widget for this [Shortcuts] widget.

 

- **debugLabel**: `String?`
  The debug label that is printed for this node when logged.

 If this label is set, then it will be displayed instead of the shortcut
 map when logged.

 This allows simplifying the diagnostic output to avoid cluttering it
 unnecessarily with large default shortcut maps.

- **includeSemantics**: `bool`
  

## Constructors

### Unnamed Constructor
Creates a const [Shortcuts] widget that owns the map of shortcuts and
 creates its own manager.

 When using this constructor, [manager] will return null.

 The [child] and [shortcuts] arguments are required.

 See also:

  * [Shortcuts.manager], a constructor that uses a [ShortcutManager] to
    manage the shortcuts list instead.

### manager
Creates a const [Shortcuts] widget that uses the [manager] to
 manage the map of shortcuts.

 If this constructor is used, [shortcuts] will return the contents of
 [ShortcutManager.shortcuts].

 The [child] and [manager] arguments are required.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
