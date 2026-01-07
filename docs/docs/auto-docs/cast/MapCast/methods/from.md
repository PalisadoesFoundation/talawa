# Method: `from`

## Description

Builds a [MapCast] whose runtime type is built from the runtime type
 arguments of [keyCast] and [valueCast].

 The static type arguments are generally not interesting for these objects,
 and so `<Object?, Object?>` is used to avoid unnecessary casts.

## Return Type
`MapCast<Object?, Object?>`

## Parameters

- `keyCast`: `Cast<Object?>`
- `valueCast`: `Cast<Object?>`
