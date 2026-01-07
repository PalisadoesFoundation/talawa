# Method: `sweep`

## Description

Forces resolution of the arena, giving the win to the first member.

 Sweep is typically after all the other processing for a [PointerUpEvent]
 have taken place. It ensures that multiple passive gestures do not cause a
 stalemate that prevents the user from interacting with the app.

 Recognizers that wish to delay resolving an arena past [PointerUpEvent]
 should call [hold] to delay sweep until [release] is called.

 See also:

  * [hold]
  * [release]

## Return Type
`void`

## Parameters

- `pointer`: `int`
