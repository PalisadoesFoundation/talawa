# Method: `hold`

## Description

Prevents the arena from being swept.

 Typically, a winner is chosen in an arena after all the other
 [PointerUpEvent] processing by [sweep]. If a recognizer wishes to delay
 resolving an arena past [PointerUpEvent], the recognizer can [hold] the
 arena open using this function. To release such a hold and let the arena
 resolve, call [release].

 See also:

  * [sweep]
  * [release]

## Return Type
`void`

## Parameters

- `pointer`: `int`
