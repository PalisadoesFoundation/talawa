# Overview for `WidgetStateColor`

## Description

Defines a [Color] that is also a [WidgetStateProperty].

 This class exists to enable widgets with [Color] valued properties
 to also accept [WidgetStateProperty&lt;Color&gt;] values. A widget
 state color property represents a color which depends on
 a widget's "interactive state". This state is represented as a
 [Set] of [WidgetState]s, like [WidgetState.pressed],
 [WidgetState.focused] and [WidgetState.hovered].

 [WidgetStateColor] should only be used with widgets that document
 their support, like [TimePickerThemeData.dayPeriodColor].

 A [WidgetStateColor] can be created in one of the following ways:
   1. Create a subclass of [WidgetStateColor] and implement the abstract `resolve` method.
   2. Use [WidgetStateColor.resolveWith] and pass in a callback that
      will be used to resolve the color in the given states.
   3. Use [WidgetStateColor.fromMap] to assign a value using a [WidgetStateMap].

 

 This example defines a [WidgetStateColor] with a const constructor.

 ```dart
 class MyColor extends WidgetStateColor 
 ```
 

 See also:

  * [MaterialStateColor], the Material specific version of `WidgetStateColor`.

## Dependencies

- Color, WidgetStateProperty

## Members

- **transparent**: `WidgetStateColor`
  A constant whose value is transparent for all states.

## Constructors

### Unnamed Constructor
Abstract const constructor. This constructor enables subclasses to provide
 const constructors so that they can be used in const expressions.

### resolveWith
Creates a [WidgetStateColor] from a [WidgetPropertyResolver&lt;Color&gt;]
 callback function.

 If used as a regular color, the color resolved in the default state (the
 empty set of states) will be used.

 The given callback parameter must return a non-null color in the default
 state.

#### Parameters

- `callback`: `WidgetPropertyResolver&lt;Color&gt;`
### fromMap
Creates a [WidgetStateColor] from a [WidgetStateMap&lt;Color&gt;].

 
 It should only be used with widgets that document support for
 [WidgetStateColor] (throws an error if used as a normal [Color]).

 

#### Parameters

- `map`: `WidgetStateMap&lt;Color&gt;`
