# Overview for `MacroImplementationExceptionImpl`

## Description

An error due to incorrect implementation was thrown during macro execution.

 For example, an incorrect argument was passed to the macro API.

 The type `Error` is usually used for such throwables, and it's common to
 allow the program to crash when one is thrown.

 In the case of macros, however, type `Exception` is used because the macro
 implementation can usefully catch it in order to give the user information
 about how to notify the macro author about the bug.

## Dependencies

- MacroExceptionImpl, MacroImplementationException

## Constructors

### Unnamed Constructor


