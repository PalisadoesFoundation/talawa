# Overview for `Tolerance`

## Description

Structure that specifies maximum allowable magnitudes for distances,
 durations, and velocity differences to be considered equal.

## Members

- **_epsilonDefault**: `double`
- **defaultTolerance**: `Tolerance`
  A default tolerance of 0.001 for all three values.

- **distance**: `double`
  The magnitude of the maximum distance between two points for them to be
 considered within tolerance.

 The units for the distance tolerance must be the same as the units used
 for the distances that are to be compared to this tolerance.

- **time**: `double`
  The magnitude of the maximum duration between two times for them to be
 considered within tolerance.

 The units for the time tolerance must be the same as the units used
 for the times that are to be compared to this tolerance.

- **velocity**: `double`
  The magnitude of the maximum difference between two velocities for them to
 be considered within tolerance.

 The units for the velocity tolerance must be the same as the units used
 for the velocities that are to be compared to this tolerance.

## Constructors

### Unnamed Constructor
Creates a [Tolerance] object. By default, the distance, time, and velocity
 tolerances are all ±0.001; the constructor arguments override this.

 The arguments should all be positive values.

