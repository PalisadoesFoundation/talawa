# Overview for `SpringSimulation`

## Description

A spring simulation.

 Models a particle attached to a spring that follows Hooke's law.

 

 This method triggers an [AnimationController] (a previously constructed
 `_controller` field) to simulate a spring oscillation.

 ```dart
 void  
 ```
 

 This [AnimationController] could be used with an [AnimatedBuilder] to
 animate the position of a child as if it were attached to a spring.

## Dependencies

- Simulation

## Members

- **_endPosition**: `double`
- **_solution**: `_SpringSolution`
- **_snapToEnd**: `bool`
## Constructors

### Unnamed Constructor
Creates a spring simulation from the provided spring description, start
 distance, end distance, and initial velocity.

 The units for the start and end distance arguments are arbitrary, but must
 be consistent with the units used for other lengths in the system.

 The units for the velocity are L/T, where L is the aforementioned
 arbitrary unit of length, and T is the time unit used for driving the
 [SpringSimulation].

 If `snapToEnd` is true, [x] will be set to `end` and [dx] to 0 when
 [isDone] returns true. This is useful for transitions that require the
 simulation to stop exactly at the end value, since the spring may not
 naturally reach the target precisely. Defaults to false.

