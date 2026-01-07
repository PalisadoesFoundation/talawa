# Overview for `SshCommandError`

## Description

An error raised when a command fails to run within the [SshCommandRunner].

 This occurs for both connection failures, and for failure to
 run the command on the remote device. This error is raised when the
 subprocess running the SSH command returns a nonzero exit code.

## Dependencies

- Error

## Members

- **message**: `String`
  The reason for the command failure.

## Constructors

### Unnamed Constructor
Basic constructor outlining the reason for the SSH command failure through
 the message string.

