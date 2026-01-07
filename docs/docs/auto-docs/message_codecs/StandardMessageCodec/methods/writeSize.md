# Method: `writeSize`

## Description

Writes a non-negative 32-bit integer [value] to [buffer]
 using an expanding 1-5 byte encoding that optimizes for small values.

 This method is intended for use by subclasses overriding
 [writeValue].

## Return Type
`void`

## Parameters

- `buffer`: `WriteBuffer`
- `value`: `int`
