# Overview for `PortForwarder`

## Description

Defines an interface for port forwarding.

 When a port forwarder is initialized, it is intended to save a port through
 which a connection is persisted along the lifetime of this object.

 To shut down a port forwarder you must call the [stop] function.

