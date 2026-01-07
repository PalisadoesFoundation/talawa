# Overview for `ReverseTween`

## Description

A [Tween] that evaluates its [parent] in reverse.

## Dependencies

- Tween

## Members

- **parent**: `Tween&lt;T&gt;`
  This tween's value is the same as the parent's value evaluated in reverse.

 This tween's [begin] is the parent's [end] and its [end] is the parent's
 [begin]. The [lerp] method returns `parent.lerp(1.0 - t)` and its
 [evaluate] method is similar.

## Constructors

### Unnamed Constructor
Construct a [Tween] that evaluates its [parent] in reverse.

