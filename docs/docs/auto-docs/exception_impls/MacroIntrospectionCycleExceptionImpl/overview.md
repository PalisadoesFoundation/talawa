# Overview for `MacroIntrospectionCycleExceptionImpl`

## Description

A cycle was detected in macro applications introspecting targets of other
 macro applications.

 The order the macros should run in is not defined, so allowing
 introspection in this case would make the macro output non-deterministic.
 Instead, all the introspection calls in the cycle fail with this exception.

## Dependencies

- MacroExceptionImpl, MacroIntrospectionCycleException

## Constructors

### Unnamed Constructor


