# Overview for `ShortcutActivator`

## Description

An interface to define the keyboard key combination to trigger a shortcut.

 [ShortcutActivator]s are used by [Shortcuts] widgets, and are mapped to
 [Intent]s, the intended behavior that the key combination should trigger.
 When a [Shortcuts] widget receives a key event, its [ShortcutManager] looks
 up the first matching [ShortcutActivator], and signals the corresponding
 [Intent], which might trigger an action as defined by a hierarchy of
 [Actions] widgets. For a detailed introduction on the mechanism and use of
 the shortcut-action system, see [Actions].

 The matching [ShortcutActivator] is looked up in the following way:

  * Find the registered [ShortcutActivator]s whose [triggers] contain the
    incoming event.
  * Of the previous list, finds the first activator whose [accepts] returns
    true in the order of insertion.

 See also:

  * [SingleActivator], an implementation that represents a single key combined
    with modifiers (control, shift, alt, meta).
  * [CharacterActivator], an implementation that represents key combinations
    that result in the specified character, such as question mark.
  * [LogicalKeySet], an implementation that requires one or more
    [LogicalKeyboardKey]s to be pressed at the same time. Prefer
    [SingleActivator] when possible.

## Constructors

### Unnamed Constructor
Abstract const constructor. This constructor enables subclasses to provide
 const constructors so that they can be used in const expressions.

