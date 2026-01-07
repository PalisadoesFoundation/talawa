# Method: `connect`

## Description

Opens a connection to a Fuchsia device.

 Accepts an `address` to a Fuchsia device, and optionally a `sshConfigPath`
 in order to open the associated ssh_config for port forwarding.

 Will throw an [ArgumentError] if `address` is malformed.

 Once this function is called, the instance of [FuchsiaRemoteConnection]
 returned will keep all associated DartVM connections opened over the
 lifetime of the object.

 At its current state Dart VM connections will not be added or removed over
 the lifetime of this object.

 Throws an [ArgumentError] if the supplied `address` is not valid IPv6 or
 IPv4.

 If `address` is IPv6 link local (usually starts with `fe80::`), then
 `interface` will probably need to be set in order to connect successfully
 (that being the outgoing interface of your machine, not the interface on
 the target machine).

 Attempts to set `address` via the environment variable
 `FUCHSIA_DEVICE_URL` in the event that the argument is not passed.
 If `address` is not supplied, `interface` is also ignored, as the format
 is expected to contain the interface as well (in the event that it is
 link-local), like the following:

 ```none
 fe80::1%eth0
 ```

 In the event that `FUCHSIA_SSH_CONFIG` is set in the environment, that
 will be used when `sshConfigPath` isn't supplied.

## Return Type
`Future&lt;FuchsiaRemoteConnection&gt;`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
