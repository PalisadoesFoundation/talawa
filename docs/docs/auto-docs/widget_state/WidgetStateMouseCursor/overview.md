# Overview for `WidgetStateMouseCursor`

## Description

Defines a [MouseCursor] whose value depends on a set of [WidgetState]s which
 represent the interactive state of a component.

 This kind of [MouseCursor] is useful when the set of interactive
 actions a widget supports varies with its state. For example, a
 mouse pointer hovering over a disabled [ListTile] should not
 display [SystemMouseCursors.click], since a disabled list tile
 doesn't respond to mouse clicks. [ListTile]'s default mouse cursor
 is a [WidgetStateMouseCursor.clickable], which resolves to
 [SystemMouseCursors.basic] when the button is disabled.

 This class should only be used for parameters that document their support
 for [WidgetStateMouseCursor].

 A [WidgetStateMouseCursor] can be created in one of the following ways:
   1. Create a subclass of [WidgetStateMouseCursor] and implement
      the abstract `resolve` method.
   2. Use [WidgetStateMouseCursor.resolveWith] and pass in a callback that
      will be used to resolve the color in the given states.
   3. Use [WidgetStateMouseCursor.fromMap] to assign a value using a [WidgetStateMap].

 
 This example defines a mouse cursor that resolves to
 [SystemMouseCursors.forbidden] when its widget is disabled.

 ** See code in examples/api/lib/widgets/widget_state/widget_state_mouse_cursor.0.dart **
 

 See also:

  * [MaterialStateMouseCursor], the Material specific version of
    `WidgetStateMouseCursor`.
  * [MouseCursor] for introduction on the mouse cursor system.
  * [SystemMouseCursors], which defines cursors that are supported by
    native platforms.

## Dependencies

- MouseCursor, WidgetStateProperty

## Members

- **clickable**: `WidgetStateMouseCursor`
  A mouse cursor for clickable widgets, which resolves differently when the
 widget is disabled.

 By default this cursor resolves to [SystemMouseCursors.click]. If the widget is
 disabled, the cursor resolves to [SystemMouseCursors.basic].

 This cursor is the default for many widgets.

- **textable**: `WidgetStateMouseCursor`
  A mouse cursor for widgets related to text, which resolves differently
 when the widget is disabled.

 By default this cursor resolves to [SystemMouseCursors.text]. If the widget is
 disabled, the cursor resolves to [SystemMouseCursors.basic].

 This cursor is the default for many widgets.

## Constructors

### Unnamed Constructor
Abstract const constructor. This constructor enables subclasses to provide
 const constructors so that they can be used in const expressions.

### resolveWith
Creates a [WidgetStateMouseCursor] using a [WidgetPropertyResolver]
 callback.

 A [debugDescription] may optionally be provided.

 If used as a regular [MouseCursor], the cursor resolved
 in the default state (the empty set of states) will be used.

#### Parameters

- `callback`: `WidgetPropertyResolver&lt;MouseCursor&gt;`
- ``: `dynamic`
### fromMap
Creates a [WidgetStateMouseCursor] from a [WidgetStateMap].

 
 It should only be used with classes that document support for
 [WidgetStateMouseCursor] (throws an error if used as a regular
 [MouseCursor].)

#### Parameters

- `map`: `WidgetStateMap&lt;MouseCursor&gt;`
