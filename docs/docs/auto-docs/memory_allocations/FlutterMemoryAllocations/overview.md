# Overview for `FlutterMemoryAllocations`

## Description

An interface for listening to object lifecycle events.

 If [kFlutterMemoryAllocationsEnabled] is true,
 [FlutterMemoryAllocations] listens to creation and disposal events
 for disposable objects in Flutter Framework.
 To dispatch other events objects, invoke
 [FlutterMemoryAllocations.dispatchObjectEvent].

 Use this class with condition `kFlutterMemoryAllocationsEnabled`,
 to make sure not to increase size of the application by the code
 of the class, if memory allocations are disabled.

 The class is optimized for massive event flow and small number of
 added or removed listeners.

## Members

- **instance**: `FlutterMemoryAllocations`
  The shared instance of [FlutterMemoryAllocations].

 Only call this when [kFlutterMemoryAllocationsEnabled] is true.

- **_listeners**: `List<ObjectEventListener?>?`
  List of listeners.

 The elements are nullable, because the listeners should be removable
 while iterating through the list.

- **_activeDispatchLoops**: `int`
  Number of active notification loops.

 When equal to zero, we can delete listeners from the list,
 otherwise should null them.

- **_listenersContainNulls**: `bool`
  If true, listeners were nulled by [removeListener].

## Constructors

### _


