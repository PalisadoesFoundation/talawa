# Method: `addAllowedPointer`

## Description

Registers a new pointer that's been checked to be allowed by this gesture
 recognizer.

 Subclasses of [GestureRecognizer] are supposed to override this method
 instead of [addPointer] because [addPointer] will be called for each
 pointer being added while [addAllowedPointer] is only called for pointers
 that are allowed by this recognizer.

## Return Type
`void`

## Parameters

- `event`: `PointerDownEvent`
