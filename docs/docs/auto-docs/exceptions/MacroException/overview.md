# Overview for `MacroException`

## Description

Base class for exceptions thrown by the host implementation during macro
 execution.

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

- Exception

