# Method: `debugDeviceActiveCursor`

## Description

Returns the active mouse cursor for a device.

 The return value is the last [MouseCursor] activated onto this device, even
 if the activation failed.

 This function is only active when asserts are enabled. In release builds,
 it always returns null.

## Return Type
`MouseCursor?`

## Parameters

- `device`: `int`
