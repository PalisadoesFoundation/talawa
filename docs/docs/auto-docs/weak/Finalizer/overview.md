# Overview for `Finalizer`

## Description

A finalizer which can be attached to Dart objects.

 A finalizer can create attachments between
 the finalizer and any number of Dart values,
 by calling [attach] with the value, along with a
 _finalization token_ and an optional _attach key_,
 which are part of the attachment.

 When a Dart value becomes inaccessible to the program,
 any finalizer that currently has an attachment to
 the value *may* have its callback function called
 with the attachment's finalization token.

 Example:
 ```dart
 class Database 
 ```
 This example has an example of an external resource that needs clean-up.
 The finalizer is used to clean up an external connection when the
 user of the API no longer has access to that connection.
 The example uses the same object as attached object and detach key,
 which is a useful approach when each attached object can be detached
 individually. Being a detachment key doesn't keep an object alive.

 No promises are made that the callback will ever be called.
 The only thing that is guaranteed is that if a finalizer's callback
 is called with a specific finalization token as argument,
 then at least one value with an attachment to the finalizer
 that has that finalization token,
 is no longer accessible to the program.

 If the finalizer *itself* becomes unreachable,
 it's allowed to be garbage collected
 and then it won't trigger any further callbacks.
 Always make sure to keep the finalizer itself reachable while it's needed.

 If multiple finalizers are attached to a single object,
 or the same finalizer is attached multiple times to an object,
 and that object becomes inaccessible to the program,
 then any number (including zero) of those attachments may trigger
 their associated finalizer's callback.
 It will not necessarily be all or none of them.

 Finalization callbacks will happen as *events*.
 They will not happen during execution of other code,
 and not as a microtask,
 but as high-level events similar to timer events.

 Finalization callbacks must not throw.

 When running on the Dart native runtime, and the callback is a native
 function rather than a Dart function, use `dart:ffi`'s [NativeFinalizer]
 instead.

## Constructors

### Unnamed Constructor
Creates a finalizer with the given finalization callback.

 The [callback] is bound to the current zone
 when the [Finalizer] is created, and will run in that zone when called.

