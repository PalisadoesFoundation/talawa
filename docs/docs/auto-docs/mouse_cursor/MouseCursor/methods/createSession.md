# Method: `createSession`

## Description

Associate a pointing device to this cursor.

 A mouse cursor class usually has a corresponding [MouseCursorSession]
 class, and instantiates such class in this method.

 This method is called each time a pointing device starts displaying this
 cursor. A given cursor can be displayed by multiple devices at the same
 time, in which case this method will be called separately for each device.

## Return Type
`MouseCursorSession`

## Parameters

- `device`: `int`
