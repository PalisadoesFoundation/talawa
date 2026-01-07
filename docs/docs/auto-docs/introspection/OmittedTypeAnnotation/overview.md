# Overview for `OmittedTypeAnnotation`

## Description

An omitted type annotation.

 This will be given whenever there is no explicit type annotation for a
 declaration.

 These type annotations can still produce valid [Code] objects, which will
 result in the inferred type being emitted into the resulting code (or
 dynamic).

 In the definition phase, you may also ask explicitly for the inferred type
 using the `inferType` API.

## Dependencies

- TypeAnnotation

