# Overview for `MapBase`

## Description

Base class for implementing a [Map].

 This class has a basic implementation of all but five of the members of
 [Map].
 A basic `Map` class can be implemented by extending this class and
 implementing `keys`, `operator[]`, `operator[]=`, `remove` and `clear`.
 The remaining operations are implemented in terms of these five.

 The `keys` iterable should have efficient [Iterable.length] and
 [Iterable.contains] operations, and it should catch concurrent modifications
 of the keys while iterating.

 A more efficient implementation is usually possible by overriding
 some of the other members as well.

## Dependencies

- Map

## Constructors

### Unnamed Constructor


