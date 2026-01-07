# Method: `exit`

## Description

Terminates the current isolate synchronously.

 This operation is potentially dangerous and should be used judiciously.
 The isolate stops operating *immediately*. It throws if the optional
 [message] does not adhere to the limitations on what can be sent from one
 isolate to another (see [SendPort.send] for more details). It also throws
 if a [finalMessagePort] is associated with an isolate spawned outside of
 current isolate group, spawned via [spawnUri]. Please refer to
 [isolate group](https://dart.dev/language/concurrency#performance-and-isolate-groups)
 for more details about isolate groups.

 If successful, a call to this method does not return. Pending `finally`
 blocks are not executed, control flow will not go back to the event loop,
 scheduled asynchronous asks will never run, and even pending isolate
 control commands may be ignored. (The isolate will send messages to ports
 already registered using [Isolate.addOnExitListener], but no further Dart
 code will run in the isolate.)

 If [finalMessagePort] is provided, and the [message] can be sent through
 it (see [SendPort.send] for more details), then the message is sent
 through that port as the final operation of the current isolate. The
 isolate terminates immediately after that [SendPort.send] call returns.

 If the port is a native port -- one provided by [ReceivePort.sendPort] or
 [RawReceivePort.sendPort] -- the system may be able to send this final
 message more efficiently than normal port communication between live
 isolates. In these cases this final message object graph will be
 reassigned to the receiving isolate without copying. Further, the
 receiving isolate will in most cases be able to receive the message
 in constant time.

## Return Type
`Never`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
