# Overview for `UndoManager`

## Description

A low-level interface to the system's undo manager.

 To receive events from the system undo manager, create an
 [UndoManagerClient] and set it as the [client] on [UndoManager].

 The [setUndoState] method can be used to update the system's undo manager
 using the `canUndo` and `canRedo` parameters.

 When the system undo or redo button is tapped, the current
 [UndoManagerClient] will receive [UndoManagerClient.handlePlatformUndo]
 with an [UndoDirection] representing whether the event is "undo" or "redo".

 Currently, only iOS has an UndoManagerPlugin implemented on the engine side.
 On iOS, this can be used to listen to the keyboard undo/redo buttons and the
 undo/redo gestures.

 See also:

 * [NSUndoManager](https://developer.apple.com/documentation/foundation/nsundomanager)

## Members

- **_instance**: `UndoManager`
- **_channel**: `MethodChannel`
- **_currentClient**: `UndoManagerClient?`
## Constructors

### _


