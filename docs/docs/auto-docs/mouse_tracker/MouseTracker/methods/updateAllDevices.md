# Method: `updateAllDevices`

## Description

Perform a device update for all detected devices.

 The [updateAllDevices] is typically called during the post frame phase,
 indicating a frame has passed and all objects have potentially moved. For
 each connected device, the [updateAllDevices] will make a hit test on the
 device's last seen position, and check if necessary changes need to be
 made.

 The [updateAllDevices] is one of the two ways of updating mouse
 states, the other one being [updateWithEvent].

## Return Type
`void`

