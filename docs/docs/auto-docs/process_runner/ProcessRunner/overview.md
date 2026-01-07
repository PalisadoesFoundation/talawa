# Overview for `ProcessRunner`

## Description

A helper class for classes that want to run a process.

 The stderr and stdout can optionally be reported as the process runs, and
 capture the stdout properly without dropping any.

## Members

- **platform**: `Platform`
  The platform to use for a starting environment.

- **subprocessOutput**: `bool`
  Set [subprocessOutput] to show output as processes run. Stdout from the
 process will be printed to stdout, and stderr printed to stderr.

- **processManager**: `ProcessManager`
  Set the [processManager] in order to inject a test instance to perform
 testing.

- **defaultWorkingDirectory**: `Directory?`
  Sets the default directory used when `workingDirectory` is not specified
 to [runProcess].

- **environment**: `Map&lt;String, String&gt;`
  The environment to run processes with.

## Constructors

### Unnamed Constructor


