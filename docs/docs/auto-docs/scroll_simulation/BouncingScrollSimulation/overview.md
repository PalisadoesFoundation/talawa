# Overview for `BouncingScrollSimulation`

## Description

An implementation of scroll physics that matches iOS.

 See also:

  * [ClampingScrollSimulation], which implements Android scroll physics.

## Dependencies

- Simulation

## Members

- **maxSpringTransferVelocity**: `double`
  The maximum velocity that can be transferred from the inertia of a ballistic
 scroll into overscroll.

- **leadingExtent**: `double`
  When [x] falls below this value the simulation switches from an internal friction
 model to a spring model which causes [x] to "spring" back to [leadingExtent].

- **trailingExtent**: `double`
  When [x] exceeds this value the simulation switches from an internal friction
 model to a spring model which causes [x] to "spring" back to [trailingExtent].

- **spring**: `SpringDescription`
  The spring used to return [x] to either [leadingExtent] or [trailingExtent].

- **_frictionSimulation**: `FrictionSimulation`
- **_springSimulation**: `Simulation`
- **_springTime**: `double`
- **_timeOffset**: `double`
## Constructors

### Unnamed Constructor
Creates a simulation group for scrolling on iOS, with the given
 parameters.

 The position and velocity arguments must use the same units as will be
 expected from the [x] and [dx] methods respectively (typically logical
 pixels and logical pixels per second respectively).

 The leading and trailing extents must use the unit of length, the same
 unit as used for the position argument and as expected from the [x]
 method (typically logical pixels).

 The units used with the provided [SpringDescription] must similarly be
 consistent with the other arguments. A default set of constants is used
 for the `spring` description if it is omitted; these defaults assume
 that the unit of length is the logical pixel.

