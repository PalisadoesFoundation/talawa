# Overview for `ReceivePort`

## Description

Together with [SendPort], the only means of communication between isolates.

 [ReceivePort]s have a `sendPort` getter which returns a [SendPort].
 Any message that is sent through this [SendPort]
 is delivered to the [ReceivePort] it has been created from. There, the
 message is dispatched to the `ReceivePort`'s listener.

 A [ReceivePort] is a non-broadcast stream. This means that it buffers
 incoming messages until a listener is registered. Only one listener can
 receive messages. See [Stream.asBroadcastStream] for transforming the port
 to a broadcast stream.

 A [ReceivePort] may have many [SendPort]s.

## Dependencies

- Stream

## Constructors

### Unnamed Constructor
Opens a long-lived port for receiving messages.

 A [ReceivePort] is a non-broadcast stream. This means that it buffers
 incoming messages until a listener is registered. Only one listener can
 receive messages. See [Stream.asBroadcastStream] for transforming the port
 to a broadcast stream.

 The optional `debugName` parameter can be set to associate a name with
 this port that can be displayed in tooling.

 A receive port is closed by canceling its subscription.

### fromRawReceivePort
Creates a [ReceivePort] from a [RawReceivePort].

 The handler of the given [rawPort] is overwritten during the construction
 of the result.

#### Parameters

- `rawPort`: `RawReceivePort`
