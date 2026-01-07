# Method: `debugReset`

## Description

Forgets all previously collected timing data.

 Use this method to scope metrics to a frame, a pointer event, or any
 other event. To do that, call [debugReset] at the start of the event, then
 call [debugCollect] at the end of the event.

 This is only meant to be used in non-release modes.

## Return Type
`void`

