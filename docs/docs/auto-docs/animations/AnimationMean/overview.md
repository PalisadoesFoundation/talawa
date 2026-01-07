# Overview for `AnimationMean`

## Description

An animation of [double]s that tracks the mean of two other animations.

 The [status] of this animation is the status of the `right` animation if it is
 moving, and the `left` animation otherwise.

 The [value] of this animation is the [double] that represents the mean value
 of the values of the `left` and `right` animations.

## Dependencies

- CompoundAnimation

## Constructors

### Unnamed Constructor
Creates an animation that tracks the mean of two other animations.

