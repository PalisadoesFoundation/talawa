# Overview for `Git`

## Description

A wrapper around git process calls that can be mocked for unit testing.

 The `Git` class is a relatively (compared to `Repository`) lightweight
 abstraction over invocations to the `git` cli tool. The main
 motivation for creating this class was so that it could be overridden in
 tests. However, now that tests rely on the [FakeProcessManager] this
 abstraction is redundant.

## Members

- **processManager**: `ProcessManager`
## Constructors

### Unnamed Constructor


