# Method: `scroll`

## Description

Tell the driver to perform a scrolling action.

 A scrolling action begins with a "pointer down" event, which commonly maps
 to finger press on the touch screen or mouse button press. A series of
 "pointer move" events follow. The action is completed by a "pointer up"
 event.

 [dx] and [dy] specify the total offset for the entire scrolling action.

 [duration] specifies the length of the action.

 The move events are generated at a given [frequency] in Hz (or events per
 second). It defaults to 60Hz.

## Return Type
`Future&lt;void&gt;`

## Parameters

- `finder`: `SerializableFinder`
- `dx`: `double`
- `dy`: `double`
- `duration`: `Duration`
- ``: `dynamic`
- ``: `dynamic`
