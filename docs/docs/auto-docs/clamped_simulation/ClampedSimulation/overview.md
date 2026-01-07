# Overview for `ClampedSimulation`

## Description

A simulation that applies limits to another simulation.

 The limits are only applied to the other simulation's outputs. For example,
 if a maximum position was applied to a gravity simulation with the
 particle's initial velocity being up, and the acceleration being down, and
 the maximum position being between the initial position and the curve's
 apogee, then the particle would return to its initial position in the same
 amount of time as it would have if the maximum had not been applied; the
 difference would just be that the position would be reported as pinned to
 the maximum value for the times that it would otherwise have been reported
 as higher.

 Similarly, this means that the [x] value will change at a rate that does not
 match the reported [dx] value while one or the other is being clamped.

 The [isDone] logic is unaffected by the clamping; it reflects the logic of
 the underlying simulation.

## Dependencies

- Simulation

## Members

- **simulation**: `Simulation`
  The simulation being clamped. Calls to [x], [dx], and [isDone] are
 forwarded to the simulation.

- **xMin**: `double`
  The minimum to apply to [x].

- **xMax**: `double`
  The maximum to apply to [x].

- **dxMin**: `double`
  The minimum to apply to [dx].

- **dxMax**: `double`
  The maximum to apply to [dx].

## Constructors

### Unnamed Constructor
Creates a [ClampedSimulation] that clamps the given simulation.

 The named arguments specify the ranges for the clamping behavior, as
 applied to [x] and [dx].

