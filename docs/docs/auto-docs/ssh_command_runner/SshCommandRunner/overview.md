# Overview for `SshCommandRunner`

## Description

Runs commands remotely on a Fuchsia device.

 Requires a Fuchsia root and build type (to load the ssh config),
 and the address of the Fuchsia device.

## Members

- **_log**: `Logger`
- **_processManager**: `ProcessManager`
- **address**: `String`
  The IPv4 address to access the Fuchsia machine over SSH.

- **sshConfigPath**: `String?`
  The path to the SSH config (optional).

- **interface**: `String`
  The name of the machine's network interface (for use with IPv6
 connections. Ignored otherwise).

## Constructors

### Unnamed Constructor
Instantiates the command runner, pointing to an `address` as well as
 an optional SSH config file path.

 If the SSH config path is supplied as an empty string, behavior is
 undefined.

 [ArgumentError] is thrown in the event that `address` is neither valid
 IPv4 nor IPv6. When connecting to a link local address (`fe80::` is
 usually at the start of the address), an interface should be supplied.

### withProcessManager
Private constructor for dependency injection of the process manager.

#### Parameters

- `_processManager`: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
