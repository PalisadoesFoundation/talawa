# Overview for `Error`

## Description

Error objects thrown in the case of a program failure.

 An `Error` object represents a program failure that the programmer
 should have avoided.

 Examples include calling a function with invalid arguments,
 or even with the wrong number of arguments,
 or calling it at a time when it is not allowed.

 These are not errors that a caller should expect or catch &mdash;
 if they occur, the program is erroneous,
 and terminating the program may be the safest response.

 When deciding that a function should throw an error,
 the conditions where it happens should be clearly described,
 and they should be detectable and predictable,
 so the programmer using the function can avoid triggering the error.

 Such descriptions often uses words like
 "must" or "must not" to describe the condition,
 and if you see words like that in a function's documentation,
 then not satisfying the requirement
 is very likely to cause an error to be thrown.

 Example (from [String.contains]):
 ```plaintext
 `startIndex` must not be negative or greater than `length`.
 ```
 In this case, an error will be thrown if `startIndex` is negative
 or too large.

 If the conditions are not detectable before calling a function,
 the called function should not throw an `Error`.
 It may still throw,
 but the caller will have to catch the thrown value,
 effectively making it an alternative result rather than an error.
 If so, we consider the thrown object an *exception* rather than an error.
 The thrown object can choose to implement [Exception]
 to document that it represents an exceptional, but not erroneous,
 occurrence, but being an [Exception] has no other effect
 than documentation.

 All non-`null` values can be thrown in Dart.
 Objects *extending* the `Error` class are handled specially:
 The first time they are thrown,
 the stack trace at the throw point is recorded
 and stored in the error object.
 It can be retrieved using the [stackTrace] getter.
 An error object that merely implements `Error`, and doesn't extend it,
 will not store the stack trace automatically.

 Error objects are also used for system wide failures
 like stack overflow or an out-of-memory situation,
 which the user is also not expected to catch or handle.

 Since errors are not created to be caught,
 there is no need for subclasses to distinguish the errors.
 Instead subclasses have been created in order to make groups
 of related errors easy to create with consistent error messages.
 For example, the [String.contains] method will use a [RangeError]
 if its `startIndex` isn't in the range `0..length`,
 which is easily created by `RangeError.range(startIndex, 0, length)`.
 Catching specific subclasses of [Error] is not intended,
 and shouldn't happen outside of testing your own code.

## Constructors

### Unnamed Constructor


