# Overview for `Isolate`

## Description

An isolated Dart execution context.

 All Dart code runs in an isolate, and code can access classes and values
 only from the same isolate. Different isolates can communicate by sending
 values through ports (see [ReceivePort], [SendPort]).

 An `Isolate` object is a reference to an isolate, usually different from
 the current isolate.
 It represents, and can be used to control, the other isolate.

 When spawning a new isolate, the spawning isolate receives an `Isolate`
 object representing the new isolate when the spawn operation succeeds.

 Isolates run code in its own event loop, and each event may run smaller tasks
 in a nested microtask queue.

 An `Isolate` object allows other isolates to control the event loop
 of the isolate that it represents, and to inspect the isolate,
 for example by pausing the isolate or by getting events when the isolate
 has an uncaught error.

 The [controlPort] identifies and gives access to controlling the isolate,
 and the [pauseCapability] and [terminateCapability] guard access
 to some control operations.
 For example, calling [pause] on an `Isolate` object created without a
 [pauseCapability], has no effect.

 The `Isolate` object provided by a spawn operation will have the
 control port and capabilities needed to control the isolate.
 New isolate objects can be created without some of these capabilities
 if necessary, using the [Isolate.new] constructor.

 An `Isolate` object cannot be sent over a `SendPort`, but the control port
 and capabilities can be sent, and can be used to create a new functioning
 `Isolate` object in the receiving port's isolate.

## Members

- **immediate**: `int`
  Argument to `ping` and `kill`: Ask for immediate action.

- **beforeNextEvent**: `int`
  Argument to `ping` and `kill`: Ask for action before the next event.

- **controlPort**: `SendPort`
  Control port used to send control messages to the isolate.

 The control port identifies the isolate.

 An `Isolate` object allows sending control messages
 through the control port.

 Some control messages require a specific capability to be passed along
 with the message (see [pauseCapability] and [terminateCapability]),
 otherwise the message is ignored by the isolate.

- **pauseCapability**: `Capability?`
  Capability granting the ability to pause the isolate.

 This capability is required by [pause].
 If the capability is `null`, or if it is not the correct pause capability
 of the isolate identified by [controlPort],
 then calls to [pause] will have no effect.

 If the isolate is spawned in a paused state, use this capability as
 argument to the [resume] method in order to resume the paused isolate.

- **terminateCapability**: `Capability?`
  Capability granting the ability to terminate the isolate.

 This capability is required by [kill] and [setErrorsFatal].
 If the capability is `null`, or if it is not the correct termination
 capability of the isolate identified by [controlPort],
 then calls to those methods will have no effect.

## Constructors

### Unnamed Constructor
Creates a new [Isolate] object with a restricted set of capabilities.

 The port should be a control port for an isolate, as taken from
 another `Isolate` object.

 The capabilities should be the subset of the capabilities that are
 available to the original isolate.
 Capabilities of an isolate are locked to that isolate, and have no effect
 anywhere else, so the capabilities should come from the same isolate as
 the control port.

 Can also be used to create an [Isolate] object from a control port, and
 any available capabilities, that have been sent through a [SendPort].

 Example:
 ```dart
 Isolate isolate = ;
 Isolate restrictedIsolate = Isolate(isolate.controlPort);
 untrustedCode(restrictedIsolate);
 ```
 This example creates a new `Isolate` object that cannot be used to
 pause or terminate the isolate. All the untrusted code can do is to
 inspect the isolate and see uncaught errors or when it terminates.

