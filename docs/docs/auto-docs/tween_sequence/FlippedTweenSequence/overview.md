# Overview for `FlippedTweenSequence`

## Description

Enables creating a flipped [Animation] whose value is defined by a sequence
 of [Tween]s.

 This creates a [TweenSequence] that evaluates to a result that flips the
 tween both horizontally and vertically.

 This tween sequence assumes that the evaluated result has to be a double
 between 0.0 and 1.0.

## Dependencies

- TweenSequence

## Constructors

### Unnamed Constructor
Creates a flipped [TweenSequence].

 The [items] parameter must be a list of one or more [TweenSequenceItem]s.

 There's a small cost associated with building a `TweenSequence` so it's
 best to reuse one, rather than rebuilding it on every frame, when that's
 possible.

