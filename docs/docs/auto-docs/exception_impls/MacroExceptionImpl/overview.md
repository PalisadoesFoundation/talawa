# Overview for `MacroExceptionImpl`

## Description

Base class for exceptions thrown during macro execution.

 Macro implementations can catch these exceptions to provide more
 information to the user. In case an exception results from user error, they
 can provide a pointer to the likely fix. If the exception results from an
 implementation error or unknown error, the macro implementation might give
 the user information on where and how to file an issue.

 If a `MacroException` is not caught by a macro implementation then it will
 be reported in a user-oriented way, for example for
 `MacroImplementationException` the displayed message suggests that there
 is a bug in the macro implementation.

## Dependencies

- RemoteInstance, MacroException

## Members

- **message**: `String`
- **stackTrace**: `String?`
## Constructors

### _


#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### Unnamed Constructor


### from
Instantiates from a throwable caught during macro execution.

 If [throwable] is already a subclass of `MacroException`, return it.
 Otherwise it's an unexpected type, return an [UnexpectedMacroException].

#### Parameters

- `throwable`: `Object`
- `stackTrace`: `StackTrace`
