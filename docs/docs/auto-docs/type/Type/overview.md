# Overview for `Type`

## Description

Runtime representation of a type.

 Type objects represent types.
 A type object can be created in several ways:
 * By a *type literal*, a type name occurring as an expression,
   like `Type type = int;`,
   or a type variable occurring as an expression, like `Type type = T;`.
 * By reading the run-time type of an object,
   like `Type type = o.runtimeType;`.
 * Through `dart:mirrors`.

 A type object is intended as an entry point for using `dart:mirrors`.
 The only operations supported are comparing to other type objects
 for equality, and converting it to a string for debugging.

