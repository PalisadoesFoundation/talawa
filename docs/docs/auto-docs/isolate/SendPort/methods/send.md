# Method: `send`

## Description

Sends an asynchronous [message] through this send port, to its
 corresponding [ReceivePort].

 If the sending and receiving isolates do not share the same code
 (an isolate created using [Isolate.spawnUri] does not share the code
 of the isolate that spawned it), the transitive object graph of [message]
 can **only** contain the following kinds of objects:

   - `null`
   - `true` and `false`
   - Instances of [int], [double], [String]
   - Instances created through list, map and set literals
   - Instances created by constructors of:
     - [List], [Map], [LinkedHashMap], [Set] and [LinkedHashSet]
     - [TransferableTypedData]
     - [Capability]
   - [SendPort] instances from [ReceivePort.sendPort] or
     [RawReceivePort.sendPort] where the receive ports are created
     using those classes' constructors.
   - Instances of [Type] representing one of the types mentioned above,
     `Object`, `dynamic`, `void` and `Never` as well as nullable variants
     of all these types. For generic types type arguments must be sendable
     types for the whole type to be sendable.

 If the sender and receiver isolate share the same code (e.g. isolates
 created via [Isolate.spawn]), the transitive object graph of [message] can
 contain any object, with the following exceptions:

   - Objects with native resources (subclasses of e.g.
     `NativeFieldWrapperClass1`). A [Socket] object for example refers
     internally to objects that have native resources attached and can
     therefore not be sent.
   - [ReceivePort]
   - [DynamicLibrary]
   - [Finalizable]
   - [Finalizer]
   - [NativeFinalizer]
   - [UserTag]
   - `MirrorReference`

 Instances of classes that either themselves are marked with
 `@pragma('vm:isolate-unsendable')`, extend or implement such classes
 cannot be sent through the ports.

 Apart from those exceptions any object can be sent. Objects that are
 identified as immutable (e.g. strings) will be shared whereas all other
 objects will be copied.

 The send happens immediately and may have a linear time cost to copy the
 transitive object graph. The send itself doesn't block (i.e. doesn't wait
 until the receiver has received the message). The corresponding receive
 port can receive the message as soon as its isolate's event loop is ready
 to deliver it, independently of what the sending isolate is doing.

 Note: Due to an implementation choice the Dart VM made for how closures
 represent captured state, closures can currently capture more state than
 they need, which can cause the transitive closure to be larger than
 needed. Open bug to address this: http://dartbug.com/36983

## Return Type
`void`

## Parameters

- `message`: `Object?`
