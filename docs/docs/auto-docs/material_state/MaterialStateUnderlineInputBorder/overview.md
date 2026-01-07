# Overview for `MaterialStateUnderlineInputBorder`

## Description

Defines a [UnderlineInputBorder] that is also a [MaterialStateProperty].

 This class exists to enable widgets with [UnderlineInputBorder] valued properties
 to also accept [MaterialStateProperty&lt;UnderlineInputBorder&gt;] values. A material
 state input border property represents an input border which depends on
 a widget's "interactive state". This state is represented as a
 [Set] of [MaterialState]s, like [MaterialState.pressed],
 [MaterialState.focused] and [MaterialState.hovered].

 [MaterialStateUnderlineInputBorder] should only be used with widgets that document
 their support, like [InputDecoration.border].

 To use a [MaterialStateUnderlineInputBorder], you can either:
   1. Create a subclass of [MaterialStateUnderlineInputBorder] and implement the abstract `resolve` method.
   2. Use [MaterialStateUnderlineInputBorder.resolveWith] and pass in a callback that
      will be used to resolve the color in the given states.

 If a [MaterialStateUnderlineInputBorder] is used for a property or a parameter that doesn't
 support resolving [MaterialStateProperty&lt;UnderlineInputBorder&gt;]s, then its default color
 value will be used for all states.

 To define a `const` [MaterialStateUnderlineInputBorder], you'll need to extend
 [MaterialStateUnderlineInputBorder] and override its [resolve] method. You'll also need
 to provide a `defaultValue` to the super constructor, so that we can know
 at compile-time what its default color is.

## Dependencies

- UnderlineInputBorder, MaterialStateProperty

## Constructors

### Unnamed Constructor
Abstract const constructor. This constructor enables subclasses to provide
 const constructors so that they can be used in const expressions.

### resolveWith
Creates a [MaterialStateUnderlineInputBorder] from a [MaterialPropertyResolver&lt;InputBorder&gt;]
 callback function.

 If used as a regular input border, the border resolved in the default state (the
 empty set of states) will be used.

 The given callback parameter must return a non-null text style in the default
 state.

#### Parameters

- `callback`: `MaterialPropertyResolver&lt;InputBorder&gt;`
