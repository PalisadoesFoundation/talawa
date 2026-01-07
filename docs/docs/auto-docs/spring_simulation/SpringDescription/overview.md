# Overview for `SpringDescription`

## Description

Structure that describes a spring's constants.

 Used to configure a [SpringSimulation].

## Members

- **mass**: `double`
  The mass of the spring (m).

 The units are arbitrary, but all springs within a system should use
 the same mass units.

 The greater the mass, the larger the amplitude of oscillation,
 and the longer the time to return to the equilibrium position.

- **stiffness**: `double`
  The spring constant (k).

 The units of stiffness are M/T², where M is the mass unit used for the
 value of the [mass] property, and T is the time unit used for driving
 the [SpringSimulation].

 Stiffness defines the spring constant, which measures the strength of
 the spring. A stiff spring applies more force to the object that is
 attached for some deviation from the rest position.

- **damping**: `double`
  The damping coefficient (c).

 It is a pure number without physical meaning and describes the oscillation
 and decay of a system after being disturbed. The larger the damping,
 the fewer oscillations and smaller the amplitude of the elastic motion.

 Do not confuse the damping _coefficient_ (c) with the damping _ratio_ (ζ).
 To create a [SpringDescription] with a damping ratio, use the [
 SpringDescription.withDampingRatio] constructor.

 The units of the damping coefficient are M/T, where M is the mass unit
 used for the value of the [mass] property, and T is the time unit used for
 driving the [SpringSimulation].

## Constructors

### Unnamed Constructor
Creates a spring given the mass, stiffness, and the damping coefficient.

 See [mass], [stiffness], and [damping] for the units of the arguments.

### withDampingRatio
Creates a spring given the mass (m), stiffness (k), and damping ratio (ζ).
 The damping ratio describes a gradual reduction in a spring oscillation.
 By using the damping ratio, you can define how rapidly the oscillations
 decay from one bounce to the next.

 The damping ratio is especially useful when trying to determining the type
 of spring to create. A ratio of 1.0 creates a critically damped
 spring, > 1.0 creates an overdamped spring and < 1.0 an underdamped one.

 See [mass] and [stiffness] for the units for those arguments. The damping
 ratio is unitless.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### withDurationAndBounce
Creates a [SpringDescription] based on a desired animation duration and
 bounce.

 This provides an intuitive way to define a spring based on its visual
 properties, [duration] and [bounce]. Check the properties' documentation
 for their definition.

 This constructor produces the same result as SwiftUI's
 `spring(duration:bounce:blendDuration:)` animation.

 
 ```dart
 final SpringDescription spring = SpringDescription.withDurationAndBounce(
   duration: const Duration(milliseconds: 300),
   bounce: 0.3,
 );
 ```
 

 See also:
 * [SpringDescription], which creates a spring by explicitly providing
 physical parameters.
 * [SpringDescription.withDampingRatio], which creates a spring with a
   damping ratio and other physical parameters.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
