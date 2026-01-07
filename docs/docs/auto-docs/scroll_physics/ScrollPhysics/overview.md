# Overview for `ScrollPhysics`

## Description

Determines the physics of a [Scrollable] widget.

 For example, determines how the [Scrollable] will behave when the user
 reaches the maximum scroll extent or when the user stops scrolling.

 When starting a physics [Simulation], the current scroll position and
 velocity are used as the initial conditions for the particle in the
 simulation. The movement of the particle in the simulation is then used to
 determine the scroll position for the widget.

 Instead of creating your own subclasses, [parent] can be used to combine
 [ScrollPhysics] objects of different types to get the desired scroll physics.
 For example:

 ```dart
 const BouncingScrollPhysics(parent: )
 ```

 You can also use `applyTo`, which is useful when you already have
 an instance of [ScrollPhysics]:

 ```dart
 ScrollPhysics physics = const ;
 // ...
 final ScrollPhysics mergedPhysics = physics.applyTo(const );
 ```

 When implementing a subclass, you must override [applyTo] so that it returns
 an appropriate instance of your subclass.  Otherwise, classes like
 [Scrollable] that inform a [ScrollPosition] will combine them with
 the default [ScrollPhysics] object instead of your custom subclass.

## Members

- **parent**: `ScrollPhysics?`
  If non-null, determines the default behavior for each method.

 If a subclass of [ScrollPhysics] does not override a method, that subclass
 will inherit an implementation from this base class that defers to
 [parent]. This mechanism lets you assemble novel combinations of
 [ScrollPhysics] subclasses at runtime. For example:

 ```dart
 const BouncingScrollPhysics(parent: )
 ```

 will result in a [ScrollPhysics] that has the combined behavior
 of [BouncingScrollPhysics] and [AlwaysScrollableScrollPhysics]:
 behaviors that are not specified in [BouncingScrollPhysics]
 (e.g. [shouldAcceptUserOffset]) will defer to [AlwaysScrollableScrollPhysics].

- **_kDefaultSpring**: `SpringDescription`
## Constructors

### Unnamed Constructor
Creates an object with the default scroll physics.

