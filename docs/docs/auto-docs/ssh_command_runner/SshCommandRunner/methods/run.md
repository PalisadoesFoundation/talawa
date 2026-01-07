# Method: `run`

## Description

Runs a command on a Fuchsia device through an SSH tunnel.

 If the subprocess creating the SSH tunnel returns a nonzero exit status,
 then an [SshCommandError] is raised.

## Return Type
`Future&lt;List&lt;String&gt;&gt;`

## Parameters

- `command`: `String`
