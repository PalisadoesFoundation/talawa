# Overview for `ValueListenable`

## Description

An interface for subclasses of [Listenable] that expose a [value].

 This interface is implemented by [ValueNotifier&lt;T&gt;] and [Animation&lt;T&gt;], and
 allows other APIs to accept either of those implementations interchangeably.

 See also:

  * [ValueListenableBuilder], a widget that uses a builder callback to
    rebuild whenever a [ValueListenable] object triggers its notifications,
    providing the builder with the value of the object.

## Dependencies

- Listenable

## Constructors

### Unnamed Constructor
Abstract const constructor. This constructor enables subclasses to provide
 const constructors so that they can be used in const expressions.

