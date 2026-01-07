# Overview for `VelocityEstimate`

## Description

A two dimensional velocity estimate.

 VelocityEstimates are computed by [VelocityTracker.getVelocityEstimate]. An
 estimate's [confidence] measures how well the velocity tracker's position
 data fit a straight line, [duration] is the time that elapsed between the
 first and last position sample used to compute the velocity, and [offset]
 is similarly the difference between the first and last positions.

 See also:

  * [VelocityTracker], which computes [VelocityEstimate]s.
  * [Velocity], which encapsulates (just) a velocity vector and provides some
    useful velocity operations.

## Members

- **pixelsPerSecond**: `Offset`
  The number of pixels per second of velocity in the x and y directions.

- **confidence**: `double`
  A value between 0.0 and 1.0 that indicates how well [VelocityTracker]
 was able to fit a straight line to its position data.

 The value of this property is 1.0 for a perfect fit, 0.0 for a poor fit.

- **duration**: `Duration`
  The time that elapsed between the first and last position sample used
 to compute [pixelsPerSecond].

- **offset**: `Offset`
  The difference between the first and last position sample used
 to compute [pixelsPerSecond].

## Constructors

### Unnamed Constructor
Creates a dimensional velocity estimate.

