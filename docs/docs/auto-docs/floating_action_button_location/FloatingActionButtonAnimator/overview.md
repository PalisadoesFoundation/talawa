# Overview for `FloatingActionButtonAnimator`

## Description

Provider of animations to move the [FloatingActionButton] between [FloatingActionButtonLocation]s.

 The [Scaffold] uses [Scaffold.floatingActionButtonAnimator] to define:

  * The [Offset] of the [FloatingActionButton] between the old and new
    [FloatingActionButtonLocation]s as part of the transition animation.
  * An [Animation] to scale the [FloatingActionButton] during the transition.
  * An [Animation] to rotate the [FloatingActionButton] during the transition.
  * Where to start a new animation from if an animation is interrupted.

 See also:

  * [FloatingActionButton], which is a circular button typically shown in the
    bottom right corner of the app.
  * [FloatingActionButtonLocation], which the [Scaffold] uses to place the
    [Scaffold.floatingActionButton] within the [Scaffold]'s layout.

## Members

- **scaling**: `FloatingActionButtonAnimator`
  Moves the [FloatingActionButton] by scaling out and then in at a new
 [FloatingActionButtonLocation].

 This animator shrinks the [FloatingActionButton] down until it disappears, then
 grows it back to full size at its new [FloatingActionButtonLocation].

 This is the default [FloatingActionButton] motion animation.

- **noAnimation**: `FloatingActionButtonAnimator`
  Creates an instance of [FloatingActionButtonAnimator] where the [FloatingActionButton]
 does not animate on entrance and exit when [FloatingActionButtonLocation] is shown
 or hidden and when transitioning between [FloatingActionButtonLocation]s.

 
 This sample showcases how to override [FloatingActionButton] entrance and exit animations
 using [FloatingActionButtonAnimator.noAnimation] in [Scaffold.floatingActionButtonAnimator].

 ** See code in examples/api/lib/material/scaffold/scaffold.floating_action_button_animator.0.dart **
 

## Constructors

### Unnamed Constructor
Abstract const constructor. This constructor enables subclasses to provide
 const constructors so that they can be used in const expressions.

