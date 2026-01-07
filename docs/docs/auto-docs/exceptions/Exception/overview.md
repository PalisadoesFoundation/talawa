# Overview for `Exception`

## Description

A marker interface implemented by all core library exceptions.

 An [Exception] is intended to convey information to the user about a failure,
 so that the error can be addressed programmatically. It is intended to be
 caught, and it should contain useful data fields.

 Creating instances of [Exception] directly with `Exception("message")`
 is discouraged in library code since it doesn't give users a precise
 type they can catch. It may be reasonable to use instances of this
 class in tests or during development.

 For failures that are not intended to be caught, use [Error]
 and its subclasses.

## Constructors

### Unnamed Constructor


