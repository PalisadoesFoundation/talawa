# Overview for `ArgumentError`

## Description

Error thrown when a function is passed an unacceptable argument.

 The method should document restrictions on the arguments it accepts,
 for example if an integer argument must be non-nullable,
 a string argument must be non-empty,
 or a `dynamic`-typed argument must actually have one of a few accepted
 types.

 The user should be able to predict which arguments will cause an
 error to be throw, and avoid calling with those.

 It's almost always a good idea to provide the unacceptable value
 as part of the error, to help the user figure out what went wrong,
 so the [ArgumentError.value] constructor is the preferred constructor.
 Use [ArgumentError.new] only when the value cannot be provided for some
 reason.

## Dependencies

- Error

## Members

- **_hasValue**: `bool`
  Whether value was provided.

- **invalidValue**: `dynamic`
  The invalid value.

- **name**: `String?`
  Name of the invalid argument, if available.

- **message**: `dynamic`
  Message describing the problem.

## Constructors

### Unnamed Constructor
Creates an error with [message] describing the problem with an argument.

 Existing code may be using `message` to hold the invalid value.
 If the `message` is not a [String], it is assumed to be a value instead
 of a message.

 If [name] is provided, it should be the name of the parameter
 which received an invalid argument.

 Prefer using [ArgumentError.value] instead to retain and document the
 invalid value as well.

### value
Creates error containing the invalid [value].

 A message is built by suffixing the [message] argument with
 the [name] argument (if provided) and the value. Example:
 ```plaintext
 Invalid argument (foo): null
 ```
 The `name` should match the argument name of the function, but if
 the function is a method implementing an interface, and its argument
 names differ from the interface, it might be more useful to use the
 interface method's argument name (or just rename arguments to match).

#### Parameters

- `value`: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### notNull
Creates an argument error for a `null` argument that must not be `null`.

#### Parameters

- ``: `dynamic`
