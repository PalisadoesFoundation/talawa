# Overview for `LateError`

## Description

Error thrown when a `late` variable is accessed inappropriately.

## Dependencies

- Error

## Members

- **_message**: `String?`
## Constructors

### Unnamed Constructor


### fieldADI
Variable written while evaluating its initializer expression.

#### Parameters

- `fieldName`: `String`
### localADI
Local variable written while evaluating its initializer expression.

#### Parameters

- `localName`: `String`
### fieldNI
Variable read before it was initialized.

#### Parameters

- `fieldName`: `String`
### localNI
Local variable read before it was initialized.

#### Parameters

- `localName`: `String`
### fieldAI
Final variable written more than once.

#### Parameters

- `fieldName`: `String`
### localAI
Final local variable written more than once.

#### Parameters

- `localName`: `String`
