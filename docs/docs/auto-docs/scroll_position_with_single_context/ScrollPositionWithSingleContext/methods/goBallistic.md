# Method: `goBallistic`

## Description

Start a physics-driven simulation that settles the [pixels] position,
 starting at a particular velocity.

 This method defers to [ScrollPhysics.createBallisticSimulation], which
 typically provides a bounce simulation when the current position is out of
 bounds and a friction simulation when the position is in bounds but has a
 non-zero velocity.

 The velocity should be in logical pixels per second.

## Return Type
`void`

## Parameters

- `velocity`: `double`
