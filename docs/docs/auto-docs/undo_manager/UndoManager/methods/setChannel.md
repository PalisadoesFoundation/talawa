# Method: `setChannel`

## Description

Set the [MethodChannel] used to communicate with the system's undo manager.

 This is only meant for testing within the Flutter SDK. Changing this
 will break the ability to set the undo status or receive undo and redo
 events from the system. This has no effect if asserts are disabled.

## Return Type
`void`

## Parameters

- `newChannel`: `MethodChannel`
