# Overview for `ExecutorFactoryToken`

## Description

A token to track registered [MacroExecutor] factories.

 Used to unregister them later on, and also handles bookkeeping for the
 factory and actual instances.

## Members

- **_factory**: `FutureOr&lt;MacroExecutor&gt; `
- **_instance**: `FutureOr&lt;MacroExecutor&gt;?`
- **_libraries**: `Set&lt;Uri&gt;`
## Constructors

### _


#### Parameters

- `_factory`: `dynamic`
- `_libraries`: `dynamic`
