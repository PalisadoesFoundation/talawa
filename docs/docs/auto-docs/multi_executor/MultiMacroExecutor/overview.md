# Overview for `MultiMacroExecutor`

## Description

A [MacroExecutor] implementation which delegates most work to other
 executors which are spawned through a provided callback.

## Dependencies

- MacroExecutor, AugmentationLibraryBuilder

## Members

- **_instanceExecutors**: `Expando&lt;ExecutorFactoryToken&gt;`
  Executors by [MacroInstanceIdentifier].

 Using an expando means we don't have to worry about cleaning  up instances
 for executors that were shut down.

- **_libraryExecutorFactories**: `Map&lt;Uri, ExecutorFactoryToken&gt;`
  Registered factories for starting up a new macro executor for a library.

- **_executorFactoryTokens**: `Set&lt;ExecutorFactoryToken&gt;`
  All known registered executor factories.

