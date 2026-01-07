# Method: `pushHandleLayers`

## Description

Marks this handler to be responsible for pushing [LeaderLayer]s for the
 selection handles.

 This handler is responsible for pushing the leader layers with the
 given layer links if they are not null. It is possible that only one layer
 is non-null if this handler is only responsible for pushing one layer
 link.

 The `startHandle` needs to be placed at the visual location of selection
 start, the `endHandle` needs to be placed at the visual location of selection
 end. Typically, the visual locations should be the same as
 [SelectionGeometry.startSelectionPoint] and
 [SelectionGeometry.endSelectionPoint].

## Return Type
`void`

## Parameters

- `startHandle`: `LayerLink?`
- `endHandle`: `LayerLink?`
