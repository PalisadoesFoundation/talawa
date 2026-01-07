# Overview for `GitException`

## Description

An exception created because a git subprocess failed.

 Known git failures will be assigned a [GitExceptionType] in the [type]
 field. If this field is null it means and unknown git failure.

## Dependencies

- Exception

## Members

- **_pushRejectedPattern**: `RegExp`
- **message**: `String`
- **args**: `List&lt;String&gt;`
- **type**: `GitExceptionType?`
## Constructors

### Unnamed Constructor


