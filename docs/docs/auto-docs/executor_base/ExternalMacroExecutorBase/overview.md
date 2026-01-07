# Overview for `ExternalMacroExecutorBase`

## Description

Base implementation for macro executors which communicate with some external
 process to run macros.

 Subtypes must extend this class and implement the [close] and [sendResult]
 apis to handle communication with the external macro program.

## Dependencies

- MacroExecutor

## Members

- **messageStream**: `Stream&lt;Object&gt;`
  The stream on which we receive messages from the external macro executor.

- **serializationMode**: `SerializationMode`
  The mode to use for serialization - must be a `server` variant.

- **_responseCompleters**: `dynamic`
  A map of response completers by request id.

- **isClosed**: `bool`
## Constructors

### Unnamed Constructor


