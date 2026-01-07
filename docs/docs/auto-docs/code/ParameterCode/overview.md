# Overview for `ParameterCode`

## Description

A piece of code identifying a syntactically valid function or function type
 parameter.

 There is no distinction here made between named and positional parameters.

 There is also no distinction between function type parameters and normal
 function parameters, so the [name] is nullable (it is not required for
 positional function type parameters).

 It is the job of the user to construct and combine these together in a way
 that creates valid parameter lists.

## Dependencies

- Code

## Members

- **defaultValue**: `Code?`
  Optional default value for this parameter (not including the ` = `).

- **keywords**: `List&lt;String&gt;`
  Any keywords to put on this parameter (before the type).

- **name**: `String?`
  Optional name of this parameter (can only be omitted for function types).

- **type**: `TypeAnnotationCode?`
  Optional type for this parameter.

- **style**: `ParameterStyle`
  The type of parameter this is.

## Constructors

### Unnamed Constructor


