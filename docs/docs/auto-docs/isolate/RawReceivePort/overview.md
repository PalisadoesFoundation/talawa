# Overview for `RawReceivePort`

## Description

A low-level asynchronous message receiver.

 A [RawReceivePort] is low level feature, and is not [Zone] aware.
 The [handler] will always be invoked  in the [Zone.root] zone.

 The port cannot be paused. The data-handler must be set before the first
 message is received, otherwise the message is lost.

 Messages can be sent to this port using [sendPort].

## Members

- **keepIsolateAlive**: `bool`
  Whether this [RawReceivePort] keeps its [Isolate] alive.

 By default, receive ports keep the [Isolate] that created them alive until
 [close] is called. If [keepIsolateAlive] is set to `false`, the isolate
 may close while the port is still open. The port is closed when the
 isolate closes, and further messages sent by the [sendPort] are ignored.

## Constructors

### Unnamed Constructor
Opens a long-lived port for receiving messages.

 A [RawReceivePort] is low level and does not work with [Zone]s. It
 cannot be paused. The data-handler must be set before the first
 message is received, otherwise the message is lost.

 If [handler] is provided, it's set as the [RawReceivePort.handler].

 The optional `debugName` parameter can be set to associate a name with
 this port that can be displayed in tooling.

