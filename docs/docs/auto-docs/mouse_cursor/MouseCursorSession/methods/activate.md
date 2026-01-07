# Method: `activate`

## Description

Override this method to do the work of changing the cursor of the device.

 Called right after this session is created.

 This method has full control over the cursor until the [dispose] call, and
 can make system calls to change the pointer cursor as many times as
 necessary (usually through [SystemChannels.mouseCursor]). It can also
 collect resources, and store the result in this object.

## Return Type
`Future&lt;void&gt;`

