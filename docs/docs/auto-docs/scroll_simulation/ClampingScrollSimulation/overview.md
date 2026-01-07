# Overview for `ClampingScrollSimulation`

## Description

An implementation of scroll physics that aligns with Android.

 For any value of [velocity], this travels the same total distance as the
 Android scroll physics.

 This scroll physics has been adjusted relative to Android's in order to make
 it ballistic, meaning that the deceleration at any moment is a function only
 of the current velocity [dx] and does not depend on how long ago the
 simulation was started.  (This is required by Flutter's scrolling protocol,
 where [ScrollActivityDelegate.goBallistic] may restart a scroll activity
 using only its current velocity and the scroll position's own state.)
 Compared to this scroll physics, Android's moves faster at the very
 beginning, then slower, and it ends at the same place but a little later.

 Times are measured in seconds, and positions in logical pixels.

 See also:

  * [BouncingScrollSimulation], which implements iOS scroll physics.

## Dependencies

- Simulation

## Members

- **position**: `double`
  The position of the particle at the beginning of the simulation, in
 logical pixels.

- **velocity**: `double`
  The velocity at which the particle is traveling at the beginning of the
 simulation, in logical pixels per second.

- **friction**: `double`
  The amount of friction the particle experiences as it travels.

 The more friction the particle experiences, the sooner it stops and the
 less far it travels.

 The default value causes the particle to travel the same total distance
 as in the Android scroll physics.

- **_duration**: `double`
  The total time the simulation will run, in seconds.

- **_distance**: `double`
  The total, signed, distance the simulation will travel, in logical pixels.

- **_kDecelerationRate**: `double`
- **_kInflexion**: `double`
- **_physicalCoeff**: `double`
## Constructors

### Unnamed Constructor
Creates a scroll physics simulation that aligns with Android scrolling.

