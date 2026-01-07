# Overview for `Animatable`

## Description

An object that can produce a value of type [T] given an [Animation&lt;double&gt;]
 as input.

 Typically, the values of the input animation are nominally in the range 0.0
 to 1.0. In principle, however, any value could be provided.

 The main subclass of [Animatable] is [Tween].

## Constructors

### Unnamed Constructor
Abstract const constructor. This constructor enables subclasses to provide
 const constructors so that they can be used in const expressions.

### fromCallback
Create a new [Animatable] from the provided [callback].

 See also:

  * [Animation.drive], which provides an example for how this can be
    used.

#### Parameters

- `callback`: `AnimatableCallback&lt;T&gt;`
