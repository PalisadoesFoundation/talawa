# Overview for `Object`

## Description

The base class for all Dart objects except `null`.

 Because `Object` is a root of the non-nullable Dart class hierarchy,
 every other non-`Null` Dart class is a subclass of `Object`.

 When you define a class, you should consider overriding [toString]
 to return a string describing an instance of that class.
 You might also need to define [hashCode] and [operator ==], as described in the
 [Implementing map keys](https://dart.dev/guides/libraries/library-tour#implementing-map-keys)
 section of the [library tour](https://dart.dev/guides/libraries/library-tour).

## Constructors

### Unnamed Constructor
Creates a new [Object] instance.

 [Object] instances have no meaningful state, and are only useful
 through their identity. An [Object] instance is equal to itself
 only.

