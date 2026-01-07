# Overview for `MethodCall`

## Description

A command object representing the invocation of a named method.

## Members

- **method**: `String`
  The name of the method to be called.

- **arguments**: `dynamic`
  The arguments for the method.

 Must be a valid value for the [MethodCodec] used.

 This property is `dynamic`, which means type-checking is skipped when accessing
 this property. To minimize the risk of type errors at runtime, the value should
 be cast to `Object?` when accessed.

## Constructors

### Unnamed Constructor
Creates a [MethodCall] representing the invocation of [method] with the
 specified [arguments].

