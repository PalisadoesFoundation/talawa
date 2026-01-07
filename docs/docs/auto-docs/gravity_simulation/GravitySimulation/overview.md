# Overview for `GravitySimulation`

## Description

A simulation that applies a constant accelerating force.

 Models a particle that follows Newton's second law of motion. The simulation
 ends when the position exceeds a defined threshold.

 

 This method triggers an [AnimationController] (a previously constructed
 `_controller` field) to simulate a fall of 300 pixels.

 ```dart
 void  
 ```
 

 This [AnimationController] could be used with an [AnimatedBuilder] to
 animate the position of a child as if it was falling.

 The end distance threshold (the constructor's third argument) must be
 specified as a positive number but can be reached in either the positive or
 negative direction. For example (assuming negative numbers represent higher
 physical positions than positive numbers, as is the case with the normal
 [Canvas] coordinate system), if the acceleration is positive ("down") the
 starting velocity is negative ("up"), and the starting distance is zero, the
 particle will climb from the origin, reach a plateau, then fall back towards
 and past the origin. If the end distance threshold is less than the height
 of the plateau, then the simulation will end during the climb; otherwise, it
 will end during the fall, after the particle travels below the origin by
 that distance.

 See also:

  * [Curves.bounceOut], a [Curve] that has a similar aesthetics but includes
    a bouncing effect.

## Dependencies

- Simulation

## Members

- **_x**: `double`
- **_v**: `double`
- **_a**: `double`
- **_end**: `double`
## Constructors

### Unnamed Constructor
Creates a [GravitySimulation] using the given arguments, which are,
 respectively: an acceleration that is to be applied continually over time;
 an initial position relative to an origin; the magnitude of the distance
 from that origin beyond which (in either direction) to consider the
 simulation to be "done", which must be positive; and an initial velocity.

 The initial position and maximum distance are measured in arbitrary length
 units L from an arbitrary origin. The units will match those used for [x].

 The time unit T used for the arguments to [x], [dx], and [isDone],
 combined with the aforementioned length unit, together determine the units
 that must be used for the velocity and acceleration arguments: L/T and
 L/T² respectively. The same units of velocity are used for the velocity
 obtained from [dx].

