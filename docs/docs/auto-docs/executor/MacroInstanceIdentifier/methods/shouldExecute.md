# Method: `shouldExecute`

## Description

Whether or not this instance should run in [phase] on [declarationKind].

 Attempting to execute a macro in a phase it doesn't support, or on a
 declaration kind it doesn't support is an error.

## Return Type
`bool`

## Parameters

- `declarationKind`: `DeclarationKind`
- `phase`: `Phase`
