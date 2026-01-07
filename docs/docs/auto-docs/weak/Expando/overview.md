# Overview for `Expando`

## Description

An [Expando] allows adding new properties to objects.

 Does not work on numbers, strings, booleans, records, `null`,
 `dart:ffi` pointers, `dart:ffi` structs, or `dart:ffi` unions.

 An `Expando` does not hold on to the added property value after an object
 becomes inaccessible.

 Since you can always create a new number that is identical to an existing
 number, it means that an expando property on a number could never be
 released. To avoid this, expando properties cannot be added to numbers.
 The same argument applies to strings, booleans and `null`, which also have
 literals that evaluate to identical values when they occur more than once.
 In addition, expando properties can not be added to records because
 records do not have a well-defined persistent identity.

 There is no restriction on other classes, even for compile time constant
 objects. Be careful if adding expando properties to compile time constants,
 since they will stay alive forever.

## Members

- **name**: `String?`
  The name of the this [Expando] as passed to the constructor.

 If no name was passed to the constructor, the value is the `null` value.

## Constructors

### Unnamed Constructor
Creates a new [Expando]. The optional name is only used for
 debugging purposes and creating two different [Expando]s with the
 same name yields two [Expando]s that work on different properties
 of the objects they are used on.

