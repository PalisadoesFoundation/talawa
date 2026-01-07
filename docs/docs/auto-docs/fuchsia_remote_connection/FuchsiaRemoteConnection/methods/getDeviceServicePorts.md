# Method: `getDeviceServicePorts`

## Description

Gets the open Dart VM service ports on a remote Fuchsia device.

 The method attempts to get service ports through an SSH connection. Upon
 successfully getting the VM service ports, returns them as a list of
 integers. If an empty list is returned, then no Dart VM instances could be
 found. An exception is thrown in the event of an actual error when
 attempting to acquire the ports.

## Return Type
`Future&lt;List&lt;int&gt;&gt;`

