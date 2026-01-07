# Overview for `FuchsiaRemoteConnection`

## Description

Manages a remote connection to a Fuchsia Device.

 Provides affordances to observe and connect to Flutter views, isolates, and
 perform actions on the Fuchsia device's various VM services.

 This class can be connected to several instances of the Fuchsia device's
 Dart VM at any given time.

## Members

- **_pollDartVms**: `bool`
- **_forwardedVmServicePorts**: `List&lt;PortForwarder&gt;`
- **_sshCommandRunner**: `SshCommandRunner`
- **_useIpV6**: `bool`
- **_dartVmPortMap**: `Map&lt;int, PortForwarder&gt;`
  A mapping of Dart VM ports (as seen on the target machine), to
 [PortForwarder] instances mapping from the local machine to the target
 machine.

- **_stalePorts**: `Set&lt;int&gt;`
  Tracks stale ports so as not to reconnect while polling.

- **_onDartVmEvent**: `Stream&lt;DartVmEvent&gt;`
- **_dartVmEventController**: `StreamController&lt;DartVmEvent&gt;`
- **_dartVmCache**: `Map&lt;Uri, DartVm?&gt;`
  VM service cache to avoid repeating handshakes across function
 calls. Keys a URI to a DartVm connection instance.

## Constructors

### _


#### Parameters

- `_useIpV6`: `dynamic`
- `_sshCommandRunner`: `dynamic`
