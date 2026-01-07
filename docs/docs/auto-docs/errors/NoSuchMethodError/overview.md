# Overview for `NoSuchMethodError`

## Description

Error thrown on an invalid function or method invocation.

 Thrown when a dynamic function or method call provides an invalid
 type argument or argument list to the function being called.
 For non-dynamic invocations, static type checking prevents
 such invalid arguments.

 Also thrown by the default implementation of [Object.noSuchMethod].

## Dependencies

- Error

## Constructors

### withInvocation
Creates a [NoSuchMethodError] corresponding to a failed method call.

 The [receiver] is the receiver of the method call.
 That is, the object on which the method was attempted called.

 The [invocation] represents the method call that failed. It
 should not be `null`.

#### Parameters

- `receiver`: `Object?`
- `invocation`: `Invocation`
