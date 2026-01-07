# Method: `from`

## Description

Builds a [ListCast] whose runtime type is built from the runtime type
 arguments of [entryCast].

 The static type argument is generally not interesting for these objects,
 and so `<Object?>` is used to avoid unnecessary casts.

## Return Type
`ListCast<Object?>`

## Parameters

- `entryCast`: `Cast`
