# Overview for `WidgetStateTextStyle`

## Description

Defines a [TextStyle] that is also a [WidgetStateProperty].

 This class exists to enable widgets with [TextStyle] valued properties
 to also accept [WidgetStateProperty&lt;TextStyle&gt;] values. A widget
 state text style property represents a text style which depends on
 a widget's "interactive state". This state is represented as a
 [Set] of [WidgetState]s, like [WidgetState.pressed],
 [WidgetState.focused] and [WidgetState.hovered].

 [WidgetStateTextStyle] should only be used with widgets that document
 their support, like [InputDecoration.labelStyle].

 A [WidgetStateTextStyle] can be created in one of the following ways:
   1. Create a subclass of [WidgetStateTextStyle] and implement the abstract `resolve` method.
   2. Use [WidgetStateTextStyle.resolveWith] and pass in a callback that
      will be used to resolve the text style in the given states.
   3. Use [WidgetStateTextStyle.fromMap] to assign a style using a [WidgetStateMap].

 See also:

  * [MaterialStateTextStyle], the Material specific version of
    `WidgetStateTextStyle`.

## Dependencies

- TextStyle, WidgetStateProperty

## Constructors

### Unnamed Constructor
Abstract const constructor. This constructor enables subclasses to provide
 const constructors so that they can be used in const expressions.

### resolveWith
Creates a [WidgetStateTextStyle] from a [WidgetPropertyResolver&lt;TextStyle&gt;]
 callback function.

 Behaves like an empty `` constructor if used as a
 regular [TextStyle].

 The given callback parameter must return a non-null text style in the default
 state.

#### Parameters

- `callback`: `WidgetPropertyResolver&lt;TextStyle&gt;`
### fromMap
Creates a [WidgetStateTextStyle] from a [WidgetStateMap].

 
 It should only be used with widgets that document support for
 [WidgetStateTextStyle] objects (throws an error if used as a regular
 [TextStyle]).

 

#### Parameters

- `map`: `WidgetStateMap&lt;TextStyle&gt;`
