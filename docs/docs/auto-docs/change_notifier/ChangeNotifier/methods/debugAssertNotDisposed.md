# Method: `debugAssertNotDisposed`

## Description

Used by subclasses to assert that the [ChangeNotifier] has not yet been
 disposed.

 
 The [debugAssertNotDisposed] function should only be called inside of an
 assert, as in this example.

 ```dart
 class MyNotifier with ChangeNotifier 
 ```
 

## Return Type
`bool`

## Parameters

- `notifier`: `ChangeNotifier`
