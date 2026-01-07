# Overview for `CallbackShortcuts`

## Description

A widget that binds key combinations to specific callbacks.

 

 This is similar to but simpler than the [Shortcuts] widget as it doesn't
 require [Intent]s and [Actions] widgets. Instead, it accepts a map
 of [ShortcutActivator]s to [VoidCallback]s.

 Unlike [Shortcuts], this widget does not separate key bindings and their
 implementations. This separation allows [Shortcuts] to have key bindings
 that adapt to the focused context. For example, the desired action for a
 deletion intent may be to delete a character in a text input, or to delete
 a file in a file menu.

 
 This example uses the [CallbackShortcuts] widget to add and subtract
 from a counter when the up or down arrow keys are pressed.

 ** See code in examples/api/lib/widgets/shortcuts/callback_shortcuts.0.dart **
 

 [Shortcuts] and [CallbackShortcuts] can both be used in the same app. As
 with any key handling widget, if this widget handles a key event then
 widgets above it in the focus chain will not receive the event. This means
 that if this widget handles a key, then an ancestor [Shortcuts] widget (or
 any other key handling widget) will not receive that key. Similarly, if
 a descendant of this widget handles the key, then the key event will not
 reach this widget for handling.

 See the article on
 [Using Actions and Shortcuts](https://flutter.dev/to/actions-shortcuts)
 for a detailed explanation.

 See also:
  * [Shortcuts], a more powerful widget for defining key bindings.
  * [Focus], a widget that defines which widgets can receive keyboard focus.

## Dependencies

- StatelessWidget

## Members

- **bindings**: `Map&lt;ShortcutActivator, VoidCallback&gt;`
  A map of key combinations to callbacks used to define the shortcut
 bindings.

 If a descendant of this widget has focus, and a key is pressed, the
 activator keys of this map will be asked if they accept the key event. If
 they do, then the corresponding callback is invoked, and the key event
 propagation is halted. If none of the activators accept the key event,
 then the key event continues to be propagated up the focus chain.

 If more than one activator accepts the key event, then all of the
 callbacks associated with activators that accept the key event are
 invoked.

 Some examples of [ShortcutActivator] subclasses that can be used to define
 the key combinations here are [SingleActivator], [CharacterActivator], and
 [LogicalKeySet].

- **child**: `Widget`
  The widget below this widget in the tree.

 

## Constructors

### Unnamed Constructor
Creates a const [CallbackShortcuts] widget.

