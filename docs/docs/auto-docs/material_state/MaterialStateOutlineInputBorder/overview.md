# Overview for `MaterialStateOutlineInputBorder`

## Description

Defines a [OutlineInputBorder] that is also a [MaterialStateProperty].

 This class exists to enable widgets with [OutlineInputBorder] valued properties
 to also accept [MaterialStateProperty&lt;OutlineInputBorder&gt;] values. A material
 state input border property represents an input border which depends on
 a widget's "interactive state". This state is represented as a
 [Set] of [MaterialState]s, like [MaterialState.pressed],
 [MaterialState.focused] and [MaterialState.hovered].

 [MaterialStateOutlineInputBorder] should only be used with widgets that document
 their support, like [InputDecoration.border].

 To use a [MaterialStateOutlineInputBorder], you can either:
   1. Create a subclass of [MaterialStateOutlineInputBorder] and implement the abstract `resolve` method.
   2. Use [MaterialStateOutlineInputBorder.resolveWith] and pass in a callback that
      will be used to resolve the color in the given states.

 If a [MaterialStateOutlineInputBorder] is used for a property or a parameter that doesn't
 support resolving [MaterialStateProperty&lt;OutlineInputBorder&gt;]s, then its default color
 value will be used for all states.

 To define a `const` [MaterialStateOutlineInputBorder], you'll need to extend
 [MaterialStateOutlineInputBorder] and override its [resolve] method. You'll also need
 to provide a `defaultValue` to the super constructor, so that we can know
 at compile-time what its default color is.

## Dependencies

- OutlineInputBorder, MaterialStateProperty

## Constructors

### Unnamed Constructor
Abstract const constructor. This constructor enables subclasses to provide
 const constructors so that they can be used in const expressions.

### resolveWith
Creates a [MaterialStateOutlineInputBorder] from a [MaterialPropertyResolver&lt;InputBorder&gt;]
 callback function.

 If used as a regular input border, the border resolved in the default state (the
 empty set of states) will be used.

 The given callback parameter must return a non-null text style in the default
 state.

#### Parameters

- `callback`: `MaterialPropertyResolver&lt;InputBorder&gt;`
