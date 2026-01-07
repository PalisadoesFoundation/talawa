# Overview for `StackTrace`

## Description

An interface implemented by all stack trace objects.

 A [StackTrace] is intended to convey information to the user about the call
 sequence that triggered an exception.

 These objects are created by the runtime, it is not possible to create
 them programmatically.

## Members

- **empty**: `dynamic`
  A stack trace object with no information.

 This stack trace is used as the default in situations where
 a stack trace is required, but the user has not supplied one.

## Constructors

### Unnamed Constructor


### fromString
Create a `StackTrace` object from [stackTraceString].

 The created stack trace will have a `toString` method returning
 `stackTraceString`.

 The `stackTraceString` can be a string returned by some other
 stack trace, or it can be any string at all.
 If the string doesn't look like a stack trace, code that interprets
 stack traces is likely to fail, so fake stack traces should be used
 with care.

#### Parameters

- `stackTraceString`: `String`
