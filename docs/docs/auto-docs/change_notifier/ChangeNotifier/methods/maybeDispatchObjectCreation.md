# Method: `maybeDispatchObjectCreation`

## Description

Dispatches event of the [object] creation to [FlutterMemoryAllocations.instance].

 If the event was already dispatched or [kFlutterMemoryAllocationsEnabled]
 is false, the method is noop.

 Tools like leak_tracker use the event of object creation to help
 developers identify the owner of the object, for troubleshooting purposes,
 by taking stack trace at the moment of the event.

 But, as [ChangeNotifier] is mixin, it does not have its own constructor. So, it
 communicates object creation in first `addListener`, that results
 in the stack trace pointing to `addListener`, not to constructor.

 To make debugging easier, invoke [ChangeNotifier.maybeDispatchObjectCreation]
 in constructor of the class. It will help
 to identify the owner.

 Make sure to invoke it with condition `if (kFlutterMemoryAllocationsEnabled) ...`
 so that the method is tree-shaken away when the flag is false.

## Return Type
`void`

## Parameters

- `object`: `ChangeNotifier`
