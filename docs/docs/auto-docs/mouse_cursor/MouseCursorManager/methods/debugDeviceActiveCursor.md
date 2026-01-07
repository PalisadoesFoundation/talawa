# Method: `debugDeviceActiveCursor`

## Description

Returns the active mouse cursor of a device.

 The return value is the last [MouseCursor] activated onto this
 device, even if the activation failed.

 Only valid when asserts are enabled. In release builds, always returns
 null.

## Return Type
`MouseCursor?`

## Parameters

- `device`: `int`
